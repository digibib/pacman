##########
# IPTABLES
##########
{% from 'pacman/common.sls' import server with context %}

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
      iface: {{ salt["pillar.get"](server+":network:wlan:iface", "eth0") }}
  cmd.wait:
    - name: iptables-restore < /etc/iptables.up.rules
    - watch:
      - file: /etc/iptables.up.rules
