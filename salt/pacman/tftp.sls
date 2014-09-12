##########
# TFTPBOOT FOLDER STRUCTURE
# includes pxeboot files, pxe settings and boot images 
##########

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

tftpd-server:
  service.running:
    - name: tftpd-hpa
    - watch:
      - file: /etc/default/tftpd-hpa
    - require:
      - file: /tftpboot