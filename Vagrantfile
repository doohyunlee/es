# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # box name
  config.vm.box = "trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.provision "shell", path: "init.sh"
  
  # port forward
  config.vm.network "forwarded_port", guest: 9200, host: 9200
  
  # network adapter
  config.vm.network "private_network", ip: "192.168.33.10" 
  
  # shared folder
  config.vm.synced_folder "..", "/var/www/html/data"

  config.vm.provider "virtualbox" do |v|
  v.memory = 8192
  v.cpus = 4
  v.name = "ES-5.x"

  end

end
