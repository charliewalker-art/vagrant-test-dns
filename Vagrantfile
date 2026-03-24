Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "Serveur-DNS-Charlie"
    vb.memory = "1024"
  end

  config.vm.network "private_network", ip: "192.168.56.30"

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.install = true
  end
end