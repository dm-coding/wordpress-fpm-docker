Vagrant.configure("2") do |config|
  # jessie's 3.16 kernel has an outstanding bug with systemd-socket-proxyd
  #config.vm.box = "debian/jessie64"

  # xenial has outstanding bugs work with libvirt
  #config.vm.box = "peru/ubuntu-16.04-server-amd64"
  #config.vm.box = "ubuntu/ubuntu-16.04-server"

  # This Xenial box seems to work however
  #config.vm.box = "nrclark/xenial64-minimal-libvirt"

  # Update: its 2018, baby!
  config.vm.box = "peru/ubuntu-18.04-server-amd64"

  config.ssh.forward_agent = true

  config.vm.synced_folder "docker", "/etc/docker/web", type: "rsync", rsync__exclude: ".git/"
  config.vm.synced_folder "ansible", "/etc/ansible", type: "rsync", rsync__exclude: ".git/"
  config.vm.synced_folder "sqlimport", "/sqlimport", type: "rsync", rsync__exclude: ".git/"

  config.vm.provider "libvirt" do |v|
      v.memory = 5000
      v.cpus = 4
  end

  # config.vm.provision "ansible" do |ansible|
  #   ansible.verbose = "v"
  #   ansible.playbook = "ansible/plays/system/install-web.yml"
  # end

  # config.vm.provision :docker
  # config.vm.provision :docker_compose,
  #   yml: [
  #     "/vagrant/docker/docker-compose.yml"
  #   ],
  #   run: "always"

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "install.yml"
  end

end