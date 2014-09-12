pacman 
==========

Department server (manager) for public access computers (digibib/pacpub).

Hosts boot and iso-images for pacpub computers, provides DHCP and internal DNS service and acts as Internet gateway.

Installation is done by SaltStack provisioning, meaning there is a master which holds controls the setup and state of minions. In a testing setup, Vagrant is used to setup virtual boxes. In a production environment, a Salt Master is needed to provision one or more department servers.

## Setup
