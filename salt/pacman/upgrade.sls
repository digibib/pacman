


updatepkgs:
  pkg.latest:
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
    - skip_verify: True
