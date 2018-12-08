# Defines LAB08 Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

	config.ssh.insert_key = true
	config.vbguest.auto_update = true

      # create Google Cloud Platform Management (hadoopmgmt) node
	config.vm.define :gcemgmt do |gcpmgmt_config|
	gcpmgmt_config.vm.box = "ubuntu/bionic64"
	gcpmgmt_config.vm.hostname = "gcemgmt"
	gcpmgmt_config.vm.synced_folder ".", "/home/vagrant/speech2text", mount_options: ["dmode=775"]
	gcpmgmt_config.vm.network :private_network, ip: "192.168.56.56"
	gcpmgmt_config.vm.provider "virtualbox" do |vb|
      	vb.name = "gcemgmt"
      	opts = ["modifyvm", :id, "--natdnshostresolver1", "on"]
      	vb.customize opts
      	vb.memory = "1024"
      end
      gcpmgmt_config.vm.provision :shell, path: "boostrap.sh"
	end

end
