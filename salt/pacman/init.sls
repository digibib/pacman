##########
# PACMAN FOR DEICHMAN
# BASED ON UBUNTU TRUSTU SERVER 64bit
##########

installpkgs:
  pkg.installed:
    - pkgs:
      - language-pack-nb
      - python-software-properties
      - software-properties-common
      - syslinux
      - bash-completion
      - curl
      - screen
      - openssh-server
      - salt-master
      - apparmor
    - skip_verify: True
