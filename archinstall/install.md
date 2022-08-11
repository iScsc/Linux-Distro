# `install.md` - a complete walkthrough to install Arch Linux
*Using `archinstall`*
---
## **TODO**
<span style="color:red"><b>Note: this document is not yet complete.</b></span>
- [ ] Add introduction & table of contents
- [ ] Add process to check integrity (MD5, SHA, GPG etc.)

*Setup: VirtualBox (VHD disk, RAM - 4096 Mo, 1 virtual processor, 40 GB storage) + archlinux-x86_64.iso*

## **Installation with `archinstall`**

*After setting up a VM to host the system*
- Launch the system
```bash
root@archiso ~ # loadkeys fr
root@archiso ~ # archinstall
```
- Enter the `archinstall` script (see code above)
- Select the following options (others options displayed during the installation are left to your personal preferences):
```
- Keyboard layout : fr
- Mirror region : ['France']
- Drive(s) : /dev/sda
- Disk Layout : 'Wipe all selected drives and use a best-effort default partition layout' > 'ext4' > 'yes'
- User account : 'dev' > ... > Should "dev" be a superuser (sudo)? - yes > confirm and exit
- Profile : Profile(minimal)
- Additionnal packages : ['firefox', 'vim']
- Network configuration : Copy ISO configuration (if using a VM)
- Install
```
