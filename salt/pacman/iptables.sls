##########
# IPTABLES
##########

iptables:
  pkg.installed

#iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
#echo 1 | tee /proc/sys/net/ipv4/ip_forward

/etc/sysctl.conf:
  file.uncomment:
    - regex: net\.ipv4\.ip_forward=1

/etc/iptables.up.rules:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/iptables.up.rules
    - template: jinja
  cmd.wait:
    - name: iptables-restore < /etc/iptables.up.rules
    - watch:
      - file: /etc/iptables.up.rules
