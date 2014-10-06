##########
# IPTABLES
##########
{% from 'pacman/common.sls' import id with context %}

iptables:
  pkg.installed

/etc/sysctl.conf:
  file.uncomment:
    - regex: net\.ipv4\.ip_forward=1

/etc/iptables.up.rules:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/iptables.up.rules
    - template: jinja
    - context:
      iface: {{ salt["pillar.get"](id+":server:network:wlan:iface", "eth0") }}
  cmd.run:
    - name: iptables-restore < /etc/iptables.up.rules
    - watch:
      - file: /etc/iptables.up.rules

# /etc/network/interfaces:
#   file.managed:
#     - source: {{ pillar['saltfiles'] }}/network-interfaces
#     - template: jinja
#     - context:
#       wlan_iface: {{ salt["pillar.get"](id+":server:network:wlan:iface", "eth0") }}
#       lan_iface: {{ salt["pillar.get"](id+":server:network:lan:iface", "eth1") }}
