Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 7474, host: 17474
  config.vm.network "forwarded_port", guest: 7473, host: 17473
  config.vm.network "forwarded_port", guest: 7687, host: 17687
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end
  config.vm.provision :shell, :path => "setup.sh"
end
