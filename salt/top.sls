base:
  '*':
    - pacman
    - pacman.tftp
    - pacman.nfs
    - pacman.dns
  '* and not klientserverhoved':
    - match: compound
    - pacman.iptables
    - pacman.dhcp # depends on dns setup

