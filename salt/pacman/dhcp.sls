##########
# DHCP
##########
{% from 'pacman/common.sls' import server,mycelclients,searchclients with context %}

isc-dhcp-server:
  pkg.installed

/etc/default/isc-dhcp-server:
  file.managed:
    - template: jinja
    - source: {{ pillar['saltfiles'] }}/isc-dhcp-server
    - context:
      iface: {{ salt["pillar.get"](server+":network:lan:iface", pillar['servers']['default']['network']['lan']['iface']) }}
    - require:
      - pkg: isc-dhcp-server

/etc/dhcp/dhcpd.conf:
  file.managed:
    - template: jinja
    - source: {{ pillar['saltfiles'] }}/dhcpd.conf
    - context:
      gateway: {{ salt["pillar.get"](server+":network:lan:gateway", pillar['servers']['default']['network']['lan']['gateway']) }}
      broadcast: {{ salt["pillar.get"](server+":network:lan:broadcast", pillar['servers']['default']['network']['lan']['broadcast']) }}
      subnet: {{ salt["pillar.get"](server+":network:lan:subnet", pillar['servers']['default']['network']['lan']['subnet']) }}
      netmask: {{ salt["pillar.get"](server+":network:lan:netmask", pillar['servers']['default']['network']['lan']['netmask']) }}
      pool_lower: {{ salt["pillar.get"](server+":network:lan:pool_lower", pillar['servers']['default']['network']['lan']['pool_upper']) }}
      pool_upper: {{ salt["pillar.get"](server+":network:lan:pool_upper", pillar['servers']['default']['network']['lan']['pool_lower']) }}
    - require:
      - pkg: isc-dhcp-server

# allow access to bind9 and rnds.key
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
      {% for client in salt['pillar.get']( mycelclients, pillar['clients']['default']['mycelclients'] ) %}
              host {{ client['name'] }} {
                  hardware ethernet {{ client['mac'] }};
                  fixed-address {{ client['ip'] }};
                  ddns-hostname "{{ client['name'] }}";
                  option host-name "{{ client['name'] }}";
                  }
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
      {% for client in salt['pillar.get']( searchclients, pillar['clients']['default']['searchclients'] ) %}
              host {{ client['name'] }} {
                  hardware ethernet {{ client['mac'] }};
                  fixed-address {{ client['ip'] }};
                  ddns-hostname "{{ client['name'] }}";
                  option host-name "{{ client['name'] }}";
                  }
      {% endfor %}
    - require:
      - pkg: isc-dhcp-server


##########
# SERVICES
##########

{% if grains.id == "klientserverhoved" %}
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
