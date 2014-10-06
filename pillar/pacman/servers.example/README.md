## Pillar Server/Client Data

Example dir to be used in pillar data

The actual files should reside in folder pillar/servers and files should match salt minion ids

init.sls should include all minion setup files in directory, e.g.:

include:
  - pacman.servers.default
  - pacman.servers.vagrant-trusty64
  ...
