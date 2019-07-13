# Custom iso

https://sysadminonline.net/centos-7-kickstart-unattended-installation-iso/
https://access.redhat.com/solutions/60959
    
## Get the Minimal ISO image

https://www.centos.org/download/

## Create a working directory

sudo mkdir -p /media/mydrive

## Mount the downloaded Centos ISO to a folder of choice.

sudo mount -o loop ~/CentOS-7-x86_64-Minimal.iso /media/mydrive

## Create a working copy of installation media

sudo mkdir -p /var/tmp/media/mydrive
sudo yum install -y rsync
sudo rsync -av /media/mydrive/ /var/tmp/media/mydrive/
sudo umount /media/mydrive

## Configure kickstart

$ sudo cp /root/anaconda-ks.cfg ~/ks.cfg
$ sudo vim ~/ks.cfg

## Validate the kickstart config

$ sudo yum install -y pykickstart
$ sudo ksvalidator ~/ks.cfg
$ sudo yum install -y pykickstart
$ sudo ksvalidator ~/ks.cfg

## Add this just before label linux

    label is
    menu label ^Kickstart
    menu default
    kernel vmlinuz
    append initrd=initrd.img    inst.stage2=hd:LABEL=CentOS\x207\x20x86_64    inst.ks=cdrom:/dev/cdrom:/ks.cfg

## Build the custom image

sudo yum install -y genisoimage
cd /var/tmp/media/mydrive
sudo genisoimage -o ../centos-7-custom.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -J -R -v -T -V 'CentOS 7 x86_64' .