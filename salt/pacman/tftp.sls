##########
# TFTPBOOT FOLDER STRUCTURE
# includes pxeboot files, pxe settings and boot images 
##########
{% from 'pacman/common.sls' import server,mycelclients,searchclients with context %}

tftpd-hpa:
  pkg.installed

/etc/default/tftpd-hpa:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/tftpd-hpa
    - require:
      - pkg: tftpd-hpa

# make sure dirs exist
mkdirs:
  cmd.run:
  - name: mkdir -p /tftpboot/boot/{newimages/{mycelimage,searchstation},mounts/{mycelimage,searchstation}}

/tftpboot:
  file.recurse:
    - template: jinja
    - file_mode: 644
    - source: {{ pillar['saltfiles'] }}/tftpboot
    - include_empty: True
    - context:
      gateway: {{ salt["pillar.get"](server+":network:lan:gateway", pillar['servers']['default']['network']['lan']['gateway']) }}

tftpd-server:
  service.running:
    - name: tftpd-hpa
    - watch:
      - file: /etc/default/tftpd-hpa
    - require:
      - file: /tftpboot