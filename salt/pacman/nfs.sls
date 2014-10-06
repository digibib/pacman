##########
# NFS 
##########
{% from 'pacman/common.sls' import id with context %}

nfs-kernel-server:
  pkg.installed

/etc/exports:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/nfs-exports
    - template: jinja
    - context:
      subnet: {{ salt["pillar.get"](id+":server:network:lan:subnet", "192.168.0.0") }}
      netmask: {{ salt["pillar.get"](id+":server:network:lan:netmask", "255.255.255.0") }}

/usr/local/bin/clientserver.sh:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/clientserver.sh
    - mode: 750

nfs-server:
  service.running:
    - name: nfs-kernel-server
    - require:
      - file: /etc/exports

reload_mounts:
  cmd.run:
    - name: /usr/local/bin/clientserver.sh restart
    - watch:
      - file: /etc/exports
      - file: /usr/local/bin/clientserver.sh
