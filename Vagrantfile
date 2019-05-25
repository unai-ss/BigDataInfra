Vagrant.require_version ">= 1.4.3"
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    i = 1
    k = 1
    j = 1
    config.vm.define "nodehdfs#{i}" do |nodeh|
        nodeh.vm.box = "CentosBox/Centos-7-v7.4-Minimal-CLI"
      #  node.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box"
        nodeh.vm.provider "virtualbox" do |v|
          v.name = "nodeh#{i}"
          v.customize ["modifyvm", :id, "--memory", "1024"]
          v.customize ["modifyvm", :id, "--usb", "on"]
          v.customize ["modifyvm", :id, "--usbehci", "off"]
        end
        nodeh.vm.network :private_network, ip: "10.211.55.101"
        #nodeh.vm.network :private_network, ip: "192.168.1.133"
        nodeh.vm.hostname = "hdfs"
        nodeh.vm.provision "shell", path: "scripts/setup-centos.sh"
        nodeh.vm.provision "shell", path: "scripts/setup-java.sh"
        nodeh.vm.provision "shell", path: "scripts/setup-hadoop.sh"
        nodeh.vm.provision "shell", path: "scripts/setup-hive.sh"
        nodeh.vm.provision "shell", path: "scripts/setup-spark.sh"
        nodeh.vm.provision "shell", path: "scripts/setupZeppelin.sh"
        nodeh.vm.provision "shell", path: "scripts/finalize-centos.sh"
    end
    config.vm.define "nodekafka#{k}" do |nodek|
        nodek.vm.box = "CentosBox/Centos-7-v7.4-Minimal-CLI"
      #  node.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box"
        nodek.vm.provider "virtualbox" do |v|
          v.name = "nodek#{k}"
          v.customize ["modifyvm", :id, "--memory", "512"]
          v.customize ["modifyvm", :id, "--usb", "on"]
          v.customize ["modifyvm", :id, "--usbehci", "off"]
        end
        nodek.vm.network :private_network, ip: "10.211.55.102"
        nodek.vm.hostname = "kafka"
        nodek.vm.provision "shell", path: "scripts/setup-centos.sh"
        nodek.vm.provision "shell", path: "scripts/setup-java.sh"
        #nodek.vm.provision "shell", path: "scripts/java_1_8.sh"
        nodek.vm.provision "shell", path: "scripts/confluent.sh"
        nodek.vm.provision "shell", path: "scripts/setupZeppelin.sh"
        nodek.vm.provision "shell", path: "scripts/finalize-centos.sh"
    end
    config.vm.define "nodeflink#{j}" do |nodej|
        nodej.vm.box = "CentosBox/Centos-7-v7.4-Minimal-CLI"
      #  node.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box"
        nodej.vm.provider "virtualbox" do |v|
          v.name = "nodef#{j}"
          v.customize ["modifyvm", :id, "--memory", "512"]
          v.customize ["modifyvm", :id, "--usb", "on"]
          v.customize ["modifyvm", :id, "--usbehci", "off"]
        end
        nodej.vm.network :private_network, ip: "10.211.55.103"
        nodej.vm.hostname = "flink"
        nodej.vm.provision "shell", path: "scripts/setup-centos.sh"
        nodej.vm.provision "shell", path: "scripts/setup-java.sh"
        #nodej.vm.provision "shell", path: "scripts/java_1_8.sh"
        nodej.vm.provision "shell", path: "scripts/flink.sh"
        nodej.vm.provision "shell", path: "scripts/setupZeppelin.sh"
        nodej.vm.provision "shell", path: "scripts/finalize-centos.sh"
    end
    config.vm.define "miniserver" do |nodes|
        nodes.vm.box = "CentosBox/Centos-7-v7.4-Minimal-CLI"
      #  node.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box"
        nodes.vm.provider "virtualbox" do |v|
          v.name = "nodem#{j}"
          v.customize ["modifyvm", :id, "--memory", "256"]
          v.customize ["modifyvm", :id, "--usb", "on"]
          v.customize ["modifyvm", :id, "--usbehci", "off"]
        end
        nodes.vm.network :private_network, ip: "10.211.55.104"
        nodes.vm.hostname = "miniserver"
        nodes.vm.provision "shell", path: "scripts/setup-centos.sh"
        nodes.vm.provision "shell", path: "scripts/kerberos_Client-1.sh"
        nodes.vm.provision "shell", path: "scripts/kerberos_KDC-2.sh"
        nodes.vm.provision "shell", path: "scripts/dnsmasq.sh"
        nodes.vm.provision "shell", path: "scripts/finalize-centos.sh"
    end

end
