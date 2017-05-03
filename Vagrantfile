# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = false
  config.vm.box = "phusion/ubuntu-14.04-amd64"
  config.vm.hostname = 'kom-dev'
  config.vm.network "private_network", auto_network: true
  config.hostmanager.aliases = %w(kom.dev www.kom.dev)
  config.vm.synced_folder "./", "/vagrant", id: "vagrant-root",
      owner: "www-data",
      group: "www-data",
      mount_options: ["dmode=755,fmode=644"]
  config.vm.provision :docker
  config.vm.provision :docker_compose, yml: "/vagrant/docker-compose.yml", run: "always"
end
