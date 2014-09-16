##########
# NFS 
##########

nfs-kernel-server:
  pkg.installed

/etc/exports:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/nfs-exports

/usr/local/bin/clientserver.sh:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/clientserver.sh
    - mode: 750

/etc/fstab:
  file.append:
    - text:
      - /tftpboot/boot/newimages/mycelimage-newest.iso /tftpboot/boot/mounts/mycelimage iso9660 auto,loop,ro 0 0
      - /tftpboot/boot/newimages/clientimage-newest.iso /tftpboot/boot/mounts/clientimage iso9660 auto,loop,ro 0 0

nfs-server:
  service.running:
    - name: nfs-kernel-server
    - require:
      - file: /etc/exports
    - watch:
      - file: /etc/fstab
