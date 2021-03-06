##########
# DNS
##########
{% from 'pacman/common.sls' import id with context %}

bind9:
  pkg.installed

/etc/bind/named.conf.options:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/named.conf.options
    - template: jinja
    - mode: 644
    - context:
      forwarder: {{ salt["pillar.get"](id+":server:network:wlan:dns", "10.172.2.1") }}
    - require:
      - pkg: bind9

/etc/bind/named.conf.local:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/named.conf.local
    - template: jinja
    - mode: 644
    - require:
      - pkg: bind9

# dns zone file for local net
/var/lib/bind/db.deichman.local.jnl:
  file.absent

/var/lib/bind/db.deichman.local:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/db.deichman.local.dns
    - template: jinja
    - mode: 644
    - replace: False
    - context:
      nameserver: {{ salt["pillar.get"](id+":server:network:lan:gateway", "192.168.0.1") }}
    - require:
      - pkg: bind9
      - file: /var/lib/bind/db.deichman.local.jnl

# reverse dns zone for local net
/var/lib/bind/db.192.168.jnl:
  file.absent

/var/lib/bind/db.192.168:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/db.192.168.dns
    - template: jinja
    - replace: False
    - mode: 644
    - require:
      - pkg: bind9
      - file: /var/lib/bind/db.192.168.jnl

dns-server:
  service.running:
    - name: bind9
    - watch:
      - file: /etc/bind/named.conf.options
      - file: /etc/bind/named.conf.local
      - file: /var/lib/bind/db.192.168
      - file: /var/lib/bind/db.deichman.local
