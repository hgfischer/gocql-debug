# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.provider 'virtualbox' do |vb|
    vb.gui = false
    vb.cpus = 1
    vb.memory = 1024
  end

  ip = File.read('VagrantBoxIP').strip!
  config.vm.define 'cqldbg01', autostart: true do |host|
    host.vm.hostname = 'cqldbg01'
    host.vm.network 'private_network', ip: ip
    host.vm.provision 'file', source: 'tpl.cassandra.yaml', destination: '/tmp/tpl.cassandra.yaml'
    host.vm.provision 'shell', path: 'bootstrap.sh', args: ip
  end
end
