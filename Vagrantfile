# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  # Create a forwarded port mapping which allows access to a specific port
  # port for BodgeIt Store
  config.vm.network "forwarded_port", guest: 32768, host: 32768
  # port for ZAP Proxy
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    #vb.gui = true
    # Customize the amount of memory on the VM:
    vb.memory = "512"
    vb.cpus = 1
  end

  ######################################################################
  # Build ZAP into a Docker image and run it
  ######################################################################
  config.vm.provision "docker" do |d|
    d.build_image "/vagrant",
      args: "-t zap:alpine"
    d.run "zap:alpine",
      args: "-d --name zap -h zap -p 8080:8080"
  end

  ######################################################################
  # Add BodgeIt Store container
  # Manually use:
  #    docker run --rm -p 8080:8080 -it psiinon/bodgeit
  ######################################################################
  config.vm.provision "docker" do |d|
    d.pull_images "psiinon/bodgeit"
    d.run "psiinon/bodgeit",
      args: "-d --name bodgeit -h bodgeit -p 32768:8080"
  end

end
