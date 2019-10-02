`systemd.unit=multi-user.target`
- Terminal mode
- systemd service started
- /root mounted

`systemd.unit=rescue.target`
- Terminal mode
- Systemd service started
- /root mounted

`systemd.unit=emergency.target`
- systemd service started
- only running process is the shell

`rd.break` (emergency mode)
- switch_root
- sysroot not mounted

`init=/sysroot/bin/sh` (Single Usermode)
- root filesystem not mounted


Source:
https://lists.freedesktop.org/archives/systemd-devel/2016-February/035709.html
