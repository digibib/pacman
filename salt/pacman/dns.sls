##########
# DNS
##########

bind9:
  pkg.installed

/etc/bind/rndc.key:
  file.managed:
    - user: root
    - group: bind
    - mode: 644

/etc/bind/named.conf.options:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/named.conf.options
    - template: jinja
    - mode: 644
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
/etc/bind/db.deichman.local:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/db.deichman.local.dns
    - template: jinja
    - mode: 644
    - require:
      - pkg: bind9

# reverse dns zone for local net
/etc/bind/db.192.168.0:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/db.192.168.0.dns
    - template: jinja
    - mode: 644
    - require:
      - pkg: bind9

dns-server:
  service.running:
    - name: bind9
    - require:
      - file: /etc/bind/named.conf.options
      - file: /etc/bind/named.conf.local
    - watch:
      - file: /etc/bind/db.192.168.0
      - file: /etc/bind/db.deichman.local
