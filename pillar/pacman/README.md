## Pillar Server/Client Data

This directories contain pillar data for pacman setup

files:

* init.sls           # global pillar data
* admin.sls.example  # example of admin.sls sensitive data
* servers.example     # example dir with server minion data

## Server setup

A folder `servers` should be created and include state files (.sls) named after minions,
containing server and client network setup.

Example minions are in the folder `servers.example`.