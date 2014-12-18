##########
# NETWORK INTERFACES
##########

{% from 'pacman/common.sls' import id with context %}

/etc/network/interfaces:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/network-interfaces
    - template: jinja
    - stateful: True
    - context:
      wlan_iface: {{ salt["pillar.get"](id+":server:network:wlan:iface", "eth0") }}
      lan_iface: {{ salt["pillar.get"](id+":server:network:lan:iface", "eth1") }}
      lan_gateway: {{ salt["pillar.get"](id+":server:network:lan:gateway", "192.168.0.1") }}
      lan_netmask: {{ salt["pillar.get"](id+":server:network:lan:netmask", "255.255.255.0") }}

network_interfaces:
  service.running:
    - name: networking
    - watch:
      - file: /etc/network/interfaces
