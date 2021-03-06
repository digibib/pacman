
all: reload provision

# halt + up is like a reload - except it should also work if there is no machine yet
reload: halt_all up_all

halt_client:
	vagrant halt client

halt_server:
	vagrant halt server

halt_all: halt_client halt_server

up_all: up_server up_client

up_server:
	vagrant up server

up_client:
	vagrant up client

provision: 
	vagrant ssh server -c 'sudo salt-call --local state.highstate'

upgrade: 
	vagrant ssh server -c 'sudo salt-call --local state.sls pacman.upgrade'

import_iso:
	vagrant ssh server -c 'sudo cp /srv/mycelimage-newest.iso /tftpboot/boot/newimages ; \
	sudo /usr/local/bin/clientserver.sh restart'

download_iso:
	vagrant ssh server -c 'sudo salt-call --local state.sls pacman.deploy-mycelimage'

clean:
	vagrant destroy --force
