# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.
  [0,1].each do |node_number|
    node_name = ( node_number == 0 ? "target" : "initiator" )

    config.vm.define node_name do |node|
      node.vm.hostname = node_name

      # Set the version of chef to install using the vagrant-omnibus plugin
      # NOTE: You will need to install the vagrant-omnibus plugin:
      #
      #   $ vagrant plugin install vagrant-omnibus
      #
      if Vagrant.has_plugin?("vagrant-omnibus")
        node.omnibus.chef_version = 'latest'
      end

      node.vm.box = 'wheezy64'

      node.vm.network :private_network, ip: "192.168.33.10#{node_number}"

      # Lets create a 100M volume in the 'target' 
      if node_number == 0
          file_to_disk = './tmp/large_disk.vdi'

          node.vm.provider :virtualbox do |vb|
            vb.customize ['createhd', '--filename', file_to_disk, '--size', '100' ] unless File.exists?(file_to_disk)
            vb.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', file_to_disk]
          end
          # initialize and format
          node.vm.provision 'shell', inline: 'echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/sdb'
          node.vm.provision 'shell', inline: 'mkfs.ext4 /dev/sdb1'
      else
      # initiators definition
        
      end

      node.berkshelf.enabled = true

      node.vm.provision :chef_solo do |chef|
        chef.json = {
          iscsi: {
            target: {
              iscsitarget_options: "--address 192.168.33.100"
            },
            initiator: {
              node_startup: 'automatic'
            }
          }
        }

        chef.run_list = [
          "recipe[iscsi::#{node_name}]"
        ]

        # Discover iSCSI target
        node.vm.provision 'shell', inline: 'iscsiadm -m discovery -t sendtargets -p 192.168.33.100 && service open-iscsi restart' unless node_number == 0

      end
    end
  end
end