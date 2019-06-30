#version=DEVEL
# System authorization information
auth --enableshadow --passalgo=sha512
# Use CDROM installation media
cdrom
# Use graphical install
graphical
# Run the Setup Agent on first boot
firstboot --enable
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8
 
# Network information
network  --bootproto=dhcp --device=eth0 --onboot=off --ipv6=auto --no-activate
network  --hostname=localhost.localdomain
 
# Root password
rootpw --plaintext guillermo
# System services
services --enabled="chronyd"
# System timezone
timezone Europe/Amsterdam --isUtc --nontp
user --name=guillermo --password=guillermo --plaintext --gecos="guillermo"
# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=vda
autopart --type=lvm
# Partition clearing information
clearpart --none --initlabel
 
%packages
@^minimal
@core
chrony
kexec-tools
 
%end