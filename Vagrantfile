# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'fileutils'  

pillar_example_files = 'pillar/**/admin.sls.example'

Dir.glob(pillar_example_files).each do | example_file |
  pillar_file =  example_file.sub(/\.example$/, '')
  if !File.file?(pillar_file)
    puts "Note! Copying #{pillar_file} from #{example_file} ..."
    FileUtils.cp(example_file, pillar_file)
  end
end

Vagrant.configure(2) do |config|

  config.vm.define "server", primary: true do |server|
    server.vm.box = "ubuntu/trusty64"
    #server.vm.box_url = "http://datatest.deichman.no/vagrant/trusty64.box"
    server.vm.synced_folder ".", "/srv"
    server.vm.network "private_network", ip: "192.168.50.10"
    server.vm.provider "virtualbox" do |v|
      v.memory = 768
      v.customize ["hostonlyif", "create"]
      v.customize ["modifyvm", :id, "--nic2", "hostonly", "--hostonlyadapter2", "vboxnet1" ]
    end
    
    # sync in servers.example pillar data
    server.vm.provision :shell, 
      inline: "rsync -avz --delete /srv/pillar/pacman/servers.example/ /srv/pillar/pacman/servers/" 

    server.vm.provision :salt do |salt|
      salt.minion_config = "salt/minion"
      salt.run_highstate = true
      salt.bootstrap_options = "-g https://github.com/saltstack/salt.git"
      salt.install_args = " v2014.7.0rc5"
      salt.install_type = "git"
      salt.verbose = true
      salt.pillar_data
    end
  end

  config.vm.define "client" do |client|
    client.vm.box_url = "http://datatest.deichman.no/vagrant/pxeboot.box"
    client.vm.box = "pxeboot"
    client.vm.network "private_network", ip: "192.168.50.101", adapter: 1
    client.vm.provider "virtualbox" do |v|
      v.gui = true
      v.memory = 2048
      # force macadress, to get correct dhcp setup
      v.customize ["modifyvm", :id, "--nic1", "hostonly", "--hostonlyadapter1", "vboxnet1", "--macaddress1", "b8ca3a5bc160"]
    end

  end


end
