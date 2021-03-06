##########
# TFTPBOOT FOLDER STRUCTURE
# includes pxeboot files, pxe settings and boot images 
##########
{% from 'pacman/common.sls' import id with context %}

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
    - name: |
        mkdir -p /tftpboot/boot/newimages
        mkdir -p /tftpboot/boot/newimages/mycelimage
        mkdir -p /tftpboot/boot/newimages/searchstation
        mkdir -p /tftpboot/boot/mounts
        mkdir -p /tftpboot/boot/mounts/mycelimage
        mkdir -p /tftpboot/boot/mounts/searchstation

/tftpboot:
  file.recurse:
    - template: jinja
    - file_mode: 644
    - source: {{ pillar['saltfiles'] }}/tftpboot
    - include_empty: True
    - context:
      gateway: {{ salt["pillar.get"](id+":server:network:lan:gateway", "192.168.0.1") }}
      boot_params: {{ salt["pillar.get"](id+":clients:boot:params", "--") }}

tftpd-server:
  service.running:
    - name: tftpd-hpa
    - watch:
      - file: /etc/default/tftpd-hpa
    - require:
      - file: /tftpboot
