
all: reload provision

# halt + up is like a reload - except it should also work if there is no machine yet
reload: halt up

halt:
	vagrant halt

up:
	vagrant up

provision: 
	# faster than vagrant provision
	vagrant ssh -c 'sudo salt-call --local state.highstate'

clean:
	vagrant destroy --force
