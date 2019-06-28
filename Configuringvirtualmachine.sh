## Configuring a virtualmachine in KVM

virt-install --name=test1.example.com --ram=2048 --vcpus=2 --disk path=/home/guillermo/SAMSUNGEVO/KVMQEMU/tester1.exmaple.com.img,size=16 --graphics=spice -c /home/guillermo/SAMSUNGEVO/ISO/CentOS-7-x86_64-DVD-1810.iso --os-type=linux --os-variant=centos7.0

