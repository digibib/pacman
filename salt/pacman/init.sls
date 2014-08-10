##########
# PACMAN FOR DEICHMAN
# BASED ON UBUNTU SAUCY SERVER 64bit
##########

installpkgs:
  pkg.installed:
    - pkgs:
      - language-pack-nb
      - python-software-properties
      - software-properties-common
      - nfs-kernel-server
      - isc-dhcp-server
      - subversion
      - syslinux
      - tftpd-hpa
      - iptables
      - bash-completion
      - curl
      - screen
      - openssh-server
      - salt-master
      - bind9
      - apparmor
    - skip_verify: True

##########
# CONFIG FILES
##########

# /etc/network/interfaces:
#   file.managed:
#     - source: {{ pillar['saltfiles'] }}/network-interfaces

/etc/default/tftpd-hpa:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/tftpd-hpa

/etc/sysctl.conf:
  file.uncomment:
    - regex: net\.ipv4\.ip_forward=1


/etc/default/isc-dhcp-server:
  file.managed:
    - template: jinja
    - source: {{ pillar['saltfiles'] }}/isc-dhcp-server

/etc/dhcp/dhcpd.conf:
  file.managed:
    - template: jinja
    - source: {{ pillar['saltfiles'] }}/dhcpd.conf

/etc/exports:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/nfs-exports

/usr/local/bin/clientserver.sh:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/clientserver.sh
    - mode: 750

##########
# DHCP - ADD STATIC CLIENTS HOSTNAMES AND IP
##########

# this block replaces static hosts with minion clients from pillar clients.sls
dhcpd_blockreplace:
  file.blockreplace:
    - name: /etc/dhcp/dhcpd.conf
    - template: jinja
    - marker_start: "### DHCP STATIC HOSTS START --DO NOT EDIT-- ###"
    - marker_end: "### DHCP STATIC HOSTS END --DO NOT EDIT-- ###"
    - append_if_not_found: True
    - content: |
      {% for client in salt['pillar.get']( "clients:{{ grains['id'] }}", pillar['clients']['default'] ) %}
              host {{ client['name'] }} {
                  hardware ethernet {{ client['mac'] }};
                  fixed-address {{ client['ip'] }};
                  ddns-hostname "{{ client['name'] }}";
                  option host-name "{{ client['name'] }}";
                  }
      {% endfor %}

##########
# DNS
##########

# need some apparmor permissions for dhcp
#/etc/apparmor.d/usr.sbin.dhcpd:

/etc/bind/rndc.key:
  file.managed:
    - user: root
    - group: bind
    - mode: 644

/etc/apparmor.d/usr.sbin.dhcpd:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/usr.sbin.dhcpd

/etc/bind/named.conf.options:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/named.conf.options
    - template: jinja
    - mode: 644
    - require:
      - pkg: installpkgs

/etc/bind/named.conf.local:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/named.conf.local
    - template: jinja
    - mode: 644
    - require:
      - pkg: installpkgs

# dns zone file for local net
/var/lib/bind/db.deichman.local:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/db.deichman.local.dns
    - template: jinja
    - mode: 644
    - require:
      - pkg: installpkgs

# reverse dns zone for local net
/var/lib/bind/db.192.168.0:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/db.192.168.0.dns
    - template: jinja
    - mode: 644
    - require:
      - pkg: installpkgs      

##########
# IPTABLES
##########

#iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
#echo 1 | tee /proc/sys/net/ipv4/ip_forward

/etc/iptables.up.rules:
  file.managed:
    - source: {{ pillar['saltfiles'] }}/iptables.up.rules
    - template: jinja
  cmd.wait:
    - name: iptables-restore < /etc/iptables.up.rules
    - watch:
      - file: /etc/iptables.up.rules

##########
# TFTPBOOT FOLDER STRUCTURE
# includes pxeboot files, pxe settings and boot images 
##########

/tftpboot:
  file.recurse:
    - template: jinja
    - file_mode: 644
    - source: {{ pillar['saltfiles'] }}/tftpboot
    - include_empty: True

##########
# IMAGES
##########

# make sure dirs exist
mkdirs:
  cmd.run:
  - name: mkdir -p /tftpboot/boot/{newimages/{mycelimage,searchstation},mounts/{mycelimage,searchstation}}

mycelimage:
  file.managed:
    - name: /tftpboot/boot/newimages/mycelimage-newest.iso
    - source: {{ pillar['filerepo'] }}/newimages/mycelimage-newest.iso
    - source_hash: {{ pillar['filerepo'] }}/newimages/mycelimage-newest.md5

searchimage:
  file.managed:
    - name: /tftpboot/boot/newimages/searchstation-newest.iso
    - source: {{ pillar['filerepo'] }}/newimages/searchstation-newest.iso
    - source_hash: {{ pillar['filerepo'] }}/newimages/searchstation-newest.md5

##########
# SERVICES
##########

isc-dhcp-server:
  service:
    - running
    - watch:
      - file: /etc/dhcp/dhcpd.conf
      - file: /etc/default/isc-dhcp-server
    - require:
      - file: /etc/default/isc-dhcp-server

nfs-kernel-server:
  service:
    - running
    - require:
      - file: /etc/exports

tftpd-hpa:
  service:
    - running
    - watch:
      - file: /etc/default/tftpd-hpa
    - require:
      - file: /tftpboot

remount:
  cmd.run:
    - name: /usr/local/bin/clientserver.sh restart
    - watch:
      - service: nfs-kernel-server
      - file: mycelimage

bind9:
  service:
    - running
    - require:
      - file: /etc/bind/named.conf.options
      - file: /etc/bind/named.conf.local
    - watch:
      - file: /etc/bind/named.conf.options
      - file: /etc/bind/named.conf.local

apparmor:
  service:
  - running
  - watch:
    - file: /etc/apparmor.d/usr.sbin.dhcpd
