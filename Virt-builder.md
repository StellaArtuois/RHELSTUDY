# Virt-builder

Virt-builder is a tool for quickly building new virtual machines. You can build a variety of VMs for local or cloud use, usually within a few minutes or less. Virt-builder also has many ways to customize these VMs. Everything is run from the command line and nothing requires root privileges, so automation and scripting is simple.

http://libguestfs.org/virt-builder.1.html

sudo virt-builder centos-7.6 --format qcow2 --size 16G --root-password password:Welkom09! --firstboot-command \ 'useradd -m -p "" guillermo ; chage -d 0 guillermo'
### Since the templates are usually very large, downloaded templates are cached in the user’s home directory.

`The location of the cache is $XDG_CACHE_HOME/virt-builder/ or $HOME/.cache/virt-builder.`

### You can download all (current) templates to the local cache by doing:

`virt-builder --cache-all-templates`

### List the virtual machines available

`virt-builder --list`

### Build my own virtualmachine

`sudo virt-builder centos-7.6 --format qcow2 --size 16G --root-password password:Welkom09!`

`sudo virt-builder centos-7.6 --format qcow2 --size 16G --root-password password:Welkom09! --firstboot-command \ 'useradd -m -p "" guillermo ; chage -d 0 guillermo'`

Flaky support: internet not working out of the box.
`sudo virt-builder ubuntu-18.04 --format qcow2 --size 32G --root-password password:Welkom09! --firstboot-command \ 'useradd -m -p "" guillermo ; chage -d 0 guillermo'`

`sudo virt-builder centos-7.6 -format qcow2 --size 32G --root-password password:Welkom09! --firstboot-command \ 'useradd -m -p "" guillermo ; chage -d 0 guillermo'`

Flaky support
`sudo virt-builder centos-8.0 -format qcow2 --size 32G --root-password password:Welkom09! --firstboot-command \ 'useradd -m -p "" guillermo ; chage -d 0 guillermo'`

test