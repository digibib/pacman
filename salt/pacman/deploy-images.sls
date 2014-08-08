##########
# CUSTOM STATE TO DEPLOY IMAGE AND RESTART NDS
##########

# make sure dirs exist first
mkdirs:
  cmd.run:
  - name: mkdir -p /tftpboot/boot/{newimages/{mycelimage,searchstation},mounts/{mycelimage,searchstation}}

mycelimage:
  file.managed:
    - name: /tftpboot/boot/newimages/mycelimage-newest.iso
    - source: {{ pillar['filerepo'] }}/newimages/mycelimage-newest.iso
    - source_hash: {{ pillar['filerepo'] }}/newimages/mycelimage-newest.md5

nfs-kernel-server:
  service:
    - running
    - watch:
      - file: mycelimage