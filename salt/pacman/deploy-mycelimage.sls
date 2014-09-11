##########
# DEPLOY MYCEL IMAGE AND RESTART NFS
##########

# basic tftpboot directory structure
mkdirs:
  cmd.run:
    - name: mkdir -p /tftpboot/boot/{newimages/{mycelimage,searchstation},mounts/{mycelimage,searchstation}}

mycelimage:
  file.managed:
    - name: /tftpboot/boot/newimages/mycelimage-newest.iso
    - source: {{ pillar['filerepo'] }}/newimages/mycelimage-newest.iso
    - source_hash: {{ pillar['filerepo'] }}/newimages/mycelimage-newest.md5

remount:
  cmd.run:
    - name: /usr/local/bin/clientserver.sh restart
    - watch:
      - file: mycelimage
