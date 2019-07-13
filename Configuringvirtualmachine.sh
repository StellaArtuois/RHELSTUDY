## Configuring a virtual machine in KVM.
virt-install --name=test1.example.com --ram=2048 --vcpus=2 --disk path=/home/guillermo/SAMSUNGEVO/KVMQEMU/tester1.example.com.qcow2,size=16,bus=virtio --graphics=spice --network=bridge:virbr0 --cdrom=/home/guillermo/SAMSUNGEVO/ISO/CentOS-7-x86_64-Minimal-1810.iso --os-type=linux --os-variant=centos7.0 


## Configuring virtual machine with kickstart and installation files from a mirror.
virt-install --name=test1.example.com --ram=2048 --vcpus=2 --disk path=/home/guillermo/SAMSUNGEVO/KVMQEMU/tester1.example.com.qcow2,size=16,bus=virtio --graphics=spice -l --network=bridge:virbr0 https://ams.edge.kernel.org/centos/7.6.1810/os/x86_64/ --os-type=linux --os-variant=centos7.0 -x "ks=ftp://192.168.122.74/pub/ks.cfg"


# Configuring virtual machine with kickstart from local server.
virt-install --name=test1.example.com --ram=2048 --vcpus=2 --disk path=/home/guillermo/KVMtester1.example.com.qcow2,size=16,bus=virtio --graphics=spice --network=bridge:virbr0 -l ftp://192.168.122.43/pub/inst --os-type=linux --os-variant=centos7.0 -x "ks=ftp://192.168.122.43/pub/ks.cfg"

# Configuring virtual machine with cutstom ISO and tty0 console.
virt-install --virt-type kvm --name=test1.example.com --ram=2048 --vcpus=2 --disk path=/home/guillermo/SAMSUNGEVO/KVMQEMU/tester1.example.com.qcow2,size=16,bus=virtio --graphics none --network=bridge:virbr0 --location=/home/guillermo/SAMSUNGEVO/ISO/centos-7-custom.iso --os-type=linux --os-variant=centos7.0 --extra-args "console=ttyS0"