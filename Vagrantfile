# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "wheezy"
  config.vm.box_url = "http://vbox.imelbox.com.s3.amazonaws.com/vagrant-debian71-x64.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.network :forwarded_port, guest: 80, host: 8080
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
#   config.vm.network :private_network, ip: "192.168.44.130"

  config.vm.provision :puppet, :module_path => "modules" do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "default.pp"
  end

  config.vm.provider "vmware_fusion" do |v|
      v.vmx["memsize"] = "4096"
      v.vmx["numvcpus"] = "4"
  end
  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file wheezy.pp in the manifests_path directory.
  #
  # An example Puppet manifest to provision the message of the day:
  #
  # # group { "puppet":
  # #   ensure => "present",
  # # }
  # #
  # # File { owner => 0, group => 0, mode => 0644 }
  # #
  # # file { '/etc/motd':
  # #   content => "Welcome to your Vagrant-built virtual machine!
  # #               Managed by Puppet.\n"
  # # }
  #
  # config.vm.provision :puppet do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "site.pp"
  # end

end
