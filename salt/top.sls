base:
  '*':
    - pacman
    - pacman.tftp
    - pacman.nfs
    - pacman.dns
    - pacman.iptables
  '* and not klientserverhoved':
    - match: compound
    - pacman.dhcp # depends on dns setup

