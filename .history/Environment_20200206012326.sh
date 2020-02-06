#!/bin/bash

# Importing GPG key
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release &&

# Validating GPG key
rpm -qa gpg-pubkey

sudo yum update -y &&

# Enable console from KVM/QEMU (Don't use in production.)

sudo systemctl start getty@tty1.service &&
sudo systemctl enable getty@tty1.service &&

# Apache
sudo yum install -y -qq -y -qq httpd &&
sudo systemctl start httpd &&
sudo systemctl enable httpd &&
sudo mkdir /var/www/html/inst &&
sudo chcon -R --reference=/var/www/html /var/www/html/inst &&
sudo firewall-cmd --permanent --add-service=http &&
sudo firewall-cmd --reload &&
sudo systemctl restart httpd &&
sudo systemctl enable httpd &&

# VSFTP
sudo yum install -y -qq vsftpd &&
sudo systemctl start vsftpd &&
sudo systemctl enable vsftpd &&
sudo firewall-cmd --permanent --add-service=ftp &&
sudo firewall-cmd --reload &&
sudo systemctl enable vsftpd &&

sudo mkdir /var/ftp/pub/inst &&
sudo firewall-cmd --permanent --add-service=ftp &&
sudo firewall-cmd --reload &&
sudo chcon -R -t public_content_t /var/ftp/ &&
sudo systemctl restart vsftpd &&
sudo systemctl enable vsftpd &&

# Yum  yum-utils - classic YUM utilities implemented as CLI shims on top of DNF

sudo yum install -y -qq yum-utils

# Installing Virt-manager and KVM
sudo yum update -y &&

# Program to configure kickstart files
sudo yum install -y -qq system-config-kickstart &&

# Terminal Browser
sudo yum install -y -qq elinks &&

# SeLinux Troubleshoot program
sudo yum install -y -qq setroubleshoot setools &&

# Cockpit is a web-based server manager https://cockpit-project.org/

sudo yum install -y -qq cockpit &&

sudo yum install -y -qq rsync &&

sudo yum install -y -qq pykickstart &&

# Auditing with Auditd Tool on CentOS/RHEL https://www.tecmint.com/linux-system-auditing-with-auditd-tool-on-centos-rhel/

sudo yum install -y -qq auditd &&

# Autofs for automatically mounting directories at request basis instead of automatically when the server starts.
# "Autofs uses the automount daemon to manage your mount points by only mounting them dynamically when they are accessed."

sudo yum install -y -qq autofs &&

# Lynis is one of the most trusted automated auditing tool for software patch management, malware scanning and vulnerability detecting in Unix/Linux based systems. (https://cisofy.com/)

sudo yum install -y -qq lynis &&


# SELinux Policy Management tool.

yum install -y -qq policycoreutils-python