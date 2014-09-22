##########
# NFS 
##########
{% from 'pacman/common.sls' import server with context %}

nfs-kernel-server:
  pkg.installed

/etc/exports:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/nfs-exports
    - template: jinja
    - context:
      subnet: {{ salt["pillar.get"](server+":network:lan:subnet", pillar['servers']['default']['network']['lan']['subnet']) }}
      netmask: {{ salt["pillar.get"](server+":network:lan:netmask", pillar['servers']['default']['network']['lan']['netmask']) }}

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
    - unless: mount | grep -e mycelclient -e searchstation
    - watch:
      - file: /etc/exports
      - file: /usr/local/bin/clientserver.sh
