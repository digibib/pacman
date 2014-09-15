base:
  '*':
    - pacman.common
    - pacman
    - pacman.iptables
    - pacman.tftp
    - pacman.nfs
    - pacman.dns
    - pacman.dhcp # depends on dns setup

