# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.host_name = 'kibana-demo'
  config.vm.box = "Ubuntu precise 64 VMWare"
  config.vm.box_url = "http://files.vagrantup.com/precise64_vmware.box"
  config.vm.forward_port 9292, 9292 # logstash default web
  config.vm.forward_port 9200, 9200 # elasticsearch
  config.vm.forward_port 80, 8080 # kibana
  
  config.vm.customize do |vm|
    vm.memory_size = 1024
  end

  config.vm.provision :puppet do |puppet|
    puppet.module_path = "./modules"
    puppet.manifests_path = "./manifests"
    puppet.manifest_file = "kibana-demo.pp"
    puppet.options = ["--verbose", "--debug" ]
  end
end