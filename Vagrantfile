Vagrant::Config.run do |config|
  config.vm.box = "ubuntu-1104-server-i386"
  config.vm.box_url = "http://dl.dropbox.com/u/7490647/talifun-ubuntu-11.04-server-i386.box"

  # this might be needed by vagrant-vbguest
  #config.vbguest.iso_path = "/Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso"

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.forward_port "http", 80, 8080
  config.vm.forward_port "mysql", 3806, 4806
  config.vm.forward_port "cuke4php", 16817, 16818
  config.vm.forward_port "monit", 3737, 3737

  # Enable provisioning with chef solo, specifying a cookbooks path (relative
  # to this Vagrantfile), and adding some recipes and/or roles.
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "vagrant_main"

    chef.json.merge!({ 
      :mysql => {:server_root_password => "foo" },
      :monit => {:poll_start_delay => 5, :poll_period => 15},
      :tz  => 'America/New_York'
    })
  end
end
