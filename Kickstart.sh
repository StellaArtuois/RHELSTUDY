#version=DEVEL
# System authorization information
auth --enableshadow --passalgo=sha512
# Use CDROM installation media
url --url ftp://192.168.122.74/pub/inst
# Use graphical install
graphical
# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-use=vda
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=dhcp --device=eth0 --ipv6=auto --no-activate
network  --hostname=localhost.localdomain

# Root password
rootpw --iscrypted $6$4X/oGleNd6LbAveL$2kQtf4OVYTaO/fl1nQDHG8k.yNW8FKxNDeupBWtTQ5sXV1Sxk8GDWE2MTLMsIeRLpu26oZA05N28KCBX9ztcc/
# System services
services --disabled="chronyd"
# System timezone
timezone Europe/Amsterdam --isUtc --nontp
user --groups=wheel --name=guillermo --password=$6$347YoQ8ZPjwaaN0C$641KaTX17rFPsykWaA6JJjHA7eK5iTLD8JmvJUE7NX03G2BsW3xWY6Zy2YXy7gFndS3L7kKDMT5D8id2dWu5x1 --iscrypted --gecos="guillermo"
# X Window System configuration information
xconfig  --startxonboot
# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=vda
# Partition clearing information
clearpart --all --initlabel --drives=vda
# Disk partitioning information
part pv.253 --fstype="lvmpv" --ondisk=vda --size=1600
part /boot --fstype="xfs" --ondisk=vda --size=500
part swap --fstype="swap" --ondisk=vda --size=1000
volgroup centos --pesize=4096 pv.253
logvol /  --fstype="xfs" --size=6000 --name=root --vgname=centos
logvol /home  --fstype="xfs" --size=600 --name=home --vgname=centos

shutdown

%packages
@^graphical-server-environment
@base
@core
@desktop-debugging
@dial-up
@fonts
@gnome-desktop
@guest-agents
@guest-desktop-agents
@hardware-monitoring 