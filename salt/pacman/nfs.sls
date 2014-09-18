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
      subnet: {{ salt["pillar.get"](server+":network:lan:subnet", "192.168.0.0") }}
      netmask: {{ salt["pillar.get"](server+":network:lan:netmask", "255.255.255.0") }}

/usr/local/bin/clientserver.sh:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/clientserver.sh
    - mode: 750

/etc/fstab:
  file.append:
    - text:
      - /tftpboot/boot/newimages/mycelimage-newest.iso /tftpboot/boot/mounts/mycelimage iso9660 auto,loop,ro 0 0
      - /tftpboot/boot/newimages/searchstation-newest.iso /tftpboot/boot/mounts/searchstation iso9660 auto,loop,ro 0 0

nfs-server:
  service.running:
    - name: nfs-kernel-server
    - require:
      - file: /etc/exports
    - watch:
      - file: /etc/fstab
