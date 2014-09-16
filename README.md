pacman 
==========

Department server (manager) for public access computers (digibib/pacpub).

Hosts boot and iso-images for pacpub computers, provides DHCP and internal DNS service and acts as Internet gateway.

Installation is done by SaltStack provisioning, meaning there is a master which holds controls the setup and state of minions. In a testing setup, Vagrant is used to setup virtual boxes. In a production environment, a Salt Master is needed to provision one or more department servers.

## Setup

Requires Vagrant ( and Virtualbox with Extension Pack for PXE client boot setup)

### Usage

`make` downloads vagrant image, sets up and provisions highstate

other commands are:

`make provision`    # run highstate
`make upgrade`      # upgrade packages on box
`make clean`        # destroy everything and cleanup

### Advanced

`vagrant ssh`       # enter vagrant box and play around

Salt states can also be run directly, e.g. 

`vagrant ssh -c 'sudo salt-call --local state.sls pacman.dhcp'    # run dhcp state (install and setup dhcp server)

## Illustration
![Alt text](pacman.png?raw=true "Pacman Saltflow")
