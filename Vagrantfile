VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.define "gitlab".to_sym do |n|
    n.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 2048]
      vb.customize ["modifyvm", :id, "--cpus", "1"]
      vb.customize ['modifyvm', :id, '--nicpromisc1', 'allow-all']
    end

    n.vm.hostname = "gitlab.local"
    n.vm.network "private_network", ip: "192.168.200.5"
    n.vm.network "forwarded_port", guest: 8888, host: 8888,
      auto_correct: true
    n.vm.network "forwarded_port", guest: 8881, host: 8881,
      auto_correct: true
    n.vm.network "forwarded_port", guest: 3443, host: 3443,
      auto_correct: true
    n.vm.network "forwarded_port", guest: 27017, host: 27017
    n.vm.network "forwarded_port", guest: 3000, host: 3000
    n.vm.synced_folder ".", "/vagrant", type: "nfs"
    n.vm.synced_folder "./srv", "/srv", type: "nfs"

    n.vm.provision :salt do |salt|
      salt.minion_config = "./etc/gitlab-minion"
      salt.log_level = "debug"
    end
  end
end
