#!/bin/bash

sudo yum update -y &&

# Apache
sudo yum -y install httpd &&
sudo systemctl start httpd &&
sudo systemctl enable httpd &&
sudo mkdir /var/www/html/inst &&
sudo chcon -R --reference=/var/www/html /var/www/html/inst &&
sudo firewall-cmd --permanent --add-service=http &&
sudo firewall-cmd --reload &&
sudo systemctl restart httpd &&
sudo systemctl enable httpd &&

# VSFTP
sudo yum install vsftpd -y &&
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

# Installing Virt-manager and KVM
sudo yum update -y &&
sudo yum group install "virtualization Host" "Virtualization client" -y &&

# Program to configure kickstart files
sudo yum install system-config-kickstart -y &&

# Terminal Browser
sudo yum install elinks -y &&

# SeLinux Troubleshoot program
sudo yum install setroubleshoot setools -y &&

# Cockpit is a web-based server manager https://cockpit-project.org/

sudo yum install cockpit -y