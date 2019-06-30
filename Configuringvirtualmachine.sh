## Configuring a virtual machine in KVM.
virt-install --network=bridge:virbr0 --name=test1.example.com --ram=2048 --vcpus=2 --disk path=/home/guillermo/SAMSUNGEVO/KVMQEMU/tester1.example.com.qcow2,size=16,bus=virtio --graphics=spice --cdrom=/home/guillermo/SAMSUNGEVO/ISO/CentOS-7-x86_64-Minimal-1810.iso --os-type=linux --os-variant=centos7.0


## Configuring virtual machine with kickstart and installation files from a mirror.
virt-install --name=test1.example.com --ram=2048 --vcpus=2 --disk path=/home/guillermo/SAMSUNGEVO/KVMQEMU/tester1.example.com.qcow2,size=16,bus=virtio --graphics=spice -l https://ams.edge.kernel.org/centos/7.6.1810/os/x86_64/ --os-type=linux --os-variant=centos7.0 -x "ks=ftp://192.168.122.74/pub/ks.cfg"
