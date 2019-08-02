# Virt-builder

Virt-builder is a tool for quickly building new virtual machines. You can build a variety of VMs for local or cloud use, usually within a few minutes or less. Virt-builder also has many ways to customize these VMs. Everything is run from the command line and nothing requires root privileges, so automation and scripting is simple.


### Since the templates are usually very large, downloaded templates are cached in the user’s home directory.

`The location of the cache is $XDG_CACHE_HOME/virt-builder/ or $HOME/.cache/virt-builder.`

### You can download all (current) templates to the local cache by doing:

`virt-builder --cache-all-templates`

### List the virtual machines available

`virt-builder --list`

### Build my own virtualmachine

`virt-builder centos-7.6 --format qcow2 --size 16G --root-password file:Welkom09!`