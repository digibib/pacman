##########
# NETWORK INTERFACES
##########

{% from 'pacman/common.sls' import id with context %}

lan_interface:
  network.managed:
    - enabled: True
    - name: {{ salt["pillar.get"](id+":server:network:lan:iface", "eth1") }}
    - type: eth
    - proto: none
    - ipaddr: {{ salt["pillar.get"](id+":server:network:lan:gateway", "192.168.0.1") }}
    - netmask: {{ salt["pillar.get"](id+":server:network:lan:netmask", "255.255.255.0") }}
