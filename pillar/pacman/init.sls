saltfiles: salt://pacman/files
filerepo: http://datatest.deichman.no/saltfiles/pacman

include:
  - pacman.admin
  - pacman.servers
