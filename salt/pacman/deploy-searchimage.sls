##########
# DEPLOY SEARCHSTATION IMAGE AND RESTART NFS
##########

# basic tftpboot directory structure
mkdirs:
  cmd.run:
    - name: mkdir -p /tftpboot/boot/{newimages/{mycelimage,searchstation},mounts/{mycelimage,searchstation}}

searchimage:
  file.managed:
    - name: /tftpboot/boot/newimages/searchstation-newest.iso
    - source: {{ pillar['filerepo'] }}/newimages/searchstation-newest.iso
    - source_hash: {{ pillar['filerepo'] }}/newimages/searchstation-newest.md5

remount:
  cmd.run:
    - name: /usr/local/bin/clientserver.sh restart
    - watch:
      - file: mycelimage
