##########
# DHCP
##########
{%- set server = "servers:"+grains.id -%}

isc-dhcp-server:
  pkg.installed

# /etc/default/isc-dhcp-server:
#   file.managed:
#     - template: jinja
#     - source: {{ pillar['saltfiles'] }}/isc-dhcp-server
#     - require:
#       - pkg: isc-dhcp-server
#     - context:
#       iface: eth0

/etc/dhcp/dhcpd.conf:
  file.managed:
    - template: jinja
    - source: {{ pillar['saltfiles'] }}/dhcpd.conf
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
dhcpd_blockreplace:
  file.blockreplace:
    - name: /etc/dhcp/dhcpd.conf
    - template: jinja
    - marker_start: "### DHCP STATIC HOSTS START --DO NOT EDIT-- ###"
    - marker_end: "### DHCP STATIC HOSTS END --DO NOT EDIT-- ###"
    - content: |
      {%- set clients = "clients:"+grains.id -%}
      {% for client in salt['pillar.get']( clients, pillar['clients']['default'] ) %}
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

dhcpd-server:
  service.running:
    - name: isc-dhcp-server
    - watch:
      - file: /etc/dhcp/dhcpd.conf
      - file: /etc/default/isc-dhcp-server
      - file: /etc/apparmor.d/usr.sbin.dhcpd
    - require:
      - file: /etc/default/isc-dhcp-server

apparmor-service:
  service.running:
    - name: apparmor
    - stateful: True
    - watch:
      - file: /etc/apparmor.d/usr.sbin.dhcpd
