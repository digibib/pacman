##########
# DHCP
##########
{% from 'pacman/common.sls' import id with context %}

isc-dhcp-server:
  pkg.installed

/etc/default/isc-dhcp-server:
  file.managed:
    - template: jinja
    - source: {{ pillar['saltfiles'] }}/isc-dhcp-server
    - context:
      iface: {{ salt["pillar.get"](id+":server:network:lan:iface", "eth1") }}
    - require:
      - pkg: isc-dhcp-server

/etc/dhcp/dhcpd.conf:
  file.managed:
    - template: jinja
    - source: {{ pillar['saltfiles'] }}/dhcpd.conf
    - context:
      gateway: {{ salt["pillar.get"](id+":server:network:lan:gateway", "192.168.0.1") }}
      broadcast: {{ salt["pillar.get"](id+":server:network:lan:broadcast", "192.168.0.255") }}
      subnet: {{ salt["pillar.get"](id+":server:network:lan:subnet", "192.168.0.0") }}
      netmask: {{ salt["pillar.get"](id+":server:network:lan:netmask", "255.255.255.0") }}
      pool_lower: {{ salt["pillar.get"](id+":server:network:lan:pool_lower", "192.168.0.60") }}
      pool_upper: {{ salt["pillar.get"](id+":server:network:lan:pool_upper", "192.168.0.70") }}
    - require:
      - pkg: isc-dhcp-server

# allow access to bind9 and rnds.key
/etc/bind/rndc.key:
  file.managed:
    - user: bind
    - group: bind
    - mode: '0644'

/etc/apparmor.d/usr.sbin.dhcpd:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/usr.sbin.dhcpd

##########
# DHCPD.CONF - ADD STATIC CLIENTS HOSTNAMES AND IP
##########

# this block replaces static hosts with minion clients from pillar clients.sls
mycelclients_blockreplace:
  file.blockreplace:
    - name: /etc/dhcp/dhcpd.conf
    - template: jinja
    - marker_start: "### PXE MYCELCLIENTS START --DO NOT EDIT-- ###"
    - marker_end: "### PXE MYCELCLIENTS END --DO NOT EDIT-- ###"
    - content: |
      {% for client in salt["pillar.get"](id+":clients:mycelclients", {}).iteritems() %}
        {% if client: %}
              host {{ client['name'] }} {
                  hardware ethernet {{ client['mac'] }};
                  fixed-address {{ client['ip'] }};
                  ddns-hostname "{{ client['name'] }}";
                  option host-name "{{ client['name'] }}";
                  }
        {% endif %}
      {% endfor %}
    - require:
      - pkg: isc-dhcp-server

# this block replaces static hosts with minion clients from pillar clients.sls
searchclients_blockreplace:
  file.blockreplace:
    - name: /etc/dhcp/dhcpd.conf
    - template: jinja
    - marker_start: "### PXE SEARCHCLIENTS SPACE --DO NOT EDIT-- ###"
    - marker_end: "### PXE SEARCHCLIENTS SPACE END --DO NOT EDIT-- ###"
    - content: |
      {% for client in salt["pillar.get"](id+":clients:searchclients", {}).iteritems() %}
        {% if client: %}
              host {{ client['name'] }} {
                  hardware ethernet {{ client['mac'] }};
                  fixed-address {{ client['ip'] }};
                  ddns-hostname "{{ client['name'] }}";
                  option host-name "{{ client['name'] }}";
                  }
        {% endif %}
      {% endfor %}
    - require:
      - pkg: isc-dhcp-server


##########
# SERVICES
##########

{% if id == "klientserverhoved" %}
dhcpd-server:
  service.dead:
    - name: isc-dhcp-server
{% else %}
dhcpd-server:
  service.running:
    - name: isc-dhcp-server
    - watch:
      - file: /etc/dhcp/dhcpd.conf
      - file: /etc/default/isc-dhcp-server
      - file: /etc/apparmor.d/usr.sbin.dhcpd
    - require:
      - file: /etc/default/isc-dhcp-server
{% endif %}

apparmor-service:
  service.running:
    - name: apparmor
    - stateful: True
    - watch:
      - file: /etc/apparmor.d/usr.sbin.dhcpd
