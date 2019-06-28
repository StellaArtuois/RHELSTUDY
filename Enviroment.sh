#!/bin/bash

yum update -y &&

yum -y install httpd &&
systemctl start httpd &&
systemctl enable httpd &&
mkdir /var/www/html/inst &&
chcon -R --reference=/var/www/html /var/www/html/inst &&
firewall-cmd --permanent --add-service=http &&
firewall-cmd --reload &&
systemctl restart httpd &&
systemctl enable httpd &&

yum install vsftpd -y &&
systemctl start vsftpd &&
systemctl enable vsftpd &&
firewall-cmd --permanent --add-service=ftp &&
firewall-cmd --reload &&
systemctl enable vsftpd &&

mkdir /var/ftp/pub/inst &&
firewall-cmd --permanent --add-service=ftp &&
firewall-cmd --reload &&
chcon -R -t public_content_t /var/ftp/ &&
systemctl restart vsftpd &&
systemctl enable vsftpd &&

sudo yum update -y &&
yum group install "virtualization Host" "Virtualization client" -y