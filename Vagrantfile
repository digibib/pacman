# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.define "server" do |server|
    server.vm.box = "trusty64"
    server.vm.box_url = "http://datatest.deichman.no/vagrant/trusty64.box"
    #server.vm.network :public_network, :adapter => 1
    server.vm.network :private_network, :ip => "192.168.0.2", :adapter => 2
    server.vm.synced_folder ".", "/srv"

    server.vm.provision :salt do |salt|
      salt.minion_config = "salt/minion"
      salt.run_highstate = true
      salt.install_type = "stable"
      #salt.always_install = true
      salt.verbose = true
      salt.pillar_data
    end
  end

  config.vm.provider "virtualbox" do |v|
    #v.customize ["natnetwork", "add", "--netname", "cv_ext", "--network", "10.0.0.0/24"]
    #v.customize ["modifyvm", :id, "--nic3", "natnetwork"]
    #v.customize ["modifyvm", :id, "--nat-network3", "cv_ext"]
  end

end
