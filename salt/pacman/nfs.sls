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

nfs-server:
  service.running:
    - name: nfs-kernel-server
    - require:
      - file: /etc/exports
