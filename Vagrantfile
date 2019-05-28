
Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.box_check_update = false
  
  config.vm.provider "virtualbox" do |v|
      v.default_nic_type = "82543GC"
      v.memory = 1024
      v.cpus = 2
  end

  config.vm.network :forwarded_port, guest: 8080,  host: 8080,  host_ip: "127.0.0.1"
  config.vm.synced_folder "./projects", "/home/vagrant/projects"
  config.vm.synced_folder "./app", "/app"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = "http://proxy:8000"
    config.proxy.https    = "http://proxy:8000"
    config.proxy.no_proxy = "localhost,127.0.0.1,.example.com"
    config.proxy.enabled  = true
    config.proxy.enabled  = { yum: false, git: false }
  end



  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
