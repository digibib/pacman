##########
# DNS
##########

bind9:
  pkg.installed

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
/var/lib/bind/db.deichman.local:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/db.deichman.local.dns
    - template: jinja
    - mode: 644
    - require:
      - pkg: bind9

# reverse dns zone for local net
/var/lib/bind/db.192.168.0:
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
      - file: /var/lib/bind/db.192.168.0
      - file: /var/lib/bind/db.deichman.local
