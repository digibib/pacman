# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'fileutils'  

pillar_example_files = 'pillar/**/*.sls.example'

Dir.glob(pillar_example_files).each do | example_file |
  pillar_file =  example_file.sub(/\.example$/, '')
  if !File.file?(pillar_file)
    puts "Note! Copying #{pillar_file} from #{example_file} ..."
    FileUtils.cp(example_file, pillar_file)
  end
end

Vagrant.configure(2) do |config|

  config.vm.define "server", primary: true do |server|
    server.vm.box = "trusty64"
    server.vm.box_url = "http://datatest.deichman.no/vagrant/trusty64.box"
    #server.vm.network :public_network, :adapter => 1
    #server.vm.network :private_network, :ip => "192.168.50.2", :adapter => 2
    server.vm.synced_folder ".", "/srv"
    server.vm.network "private_network", ip: "192.168.50.10"
    # http://fgrehm.viewdocs.io/vagrant-cachier
    if Vagrant.has_plugin?("vagrant-cachier")
      server.cache.scope = :box
    end

    server.vm.provision :salt do |salt|
      salt.minion_config = "salt/minion"
      salt.run_highstate = true
      salt.install_type = "stable"
      salt.verbose = true
      salt.pillar_data
    end
  end

  config.vm.define "client" do |client|
    # https://vagrantcloud.com/ubuntu/trusty64
    client.vm.box = "trusty64"

    if Vagrant.has_plugin?("vagrant-cachier")
      client.cache.scope = :box
    end

    client.vm.network "private_network", ip: "192.168.50.11"

  end # ls-test

  config.vm.provider "virtualbox" do |v|
    #v.customize ["natnetwork", "add", "--netname", "cv_ext", "--network", "10.0.0.0/24"]
    #v.customize ["modifyvm", :id, "--nic3", "natnetwork"]
    #v.customize ["modifyvm", :id, "--nat-network3", "cv_ext"]
  end

end
