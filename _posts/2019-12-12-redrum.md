---
layout: post
current: post
cover:  assets/images/parrot.PNG
navigation: True
title: Parrot OS on WSL 2
date: 2017-07-27 06:00:00
tags: [tutorials]
class: post-template
subclass: 'post'
author: jeffmur
---

How to set-up WSL 2, and upgrade Debian to Parrot OS.

# Installing on WSL2
Note: This option only works in Windows 10, where our final set up will include a GUI and CLI for Parrot OS by upgrading a Debian WSL app.
## WSL 2
[Follow this tutorial](https://docs.microsoft.com/en-us/windows/wsl/install-win10#update-to-wsl-2) via Microsoft Docs
### Requirements:
> Running Windows 10, updated to version 2004
**Build 19041** or higher.
> 64-bit Machine (for Kernel Update)

### Install WSL
Open PowerShell as Admin and run:
``` cmd
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```
*Restart* your machine and complete WSL install

### Update to WSL 2
Open PowerShell as Admin
``` cmd
wsl --set-default-version 2
```
If you see 
> WSL 2 requires an update to its kernel component. For information please visit [aka.ms/wsl2kernel](https://aka.ms/wsl2kernel)

**Download** and **install** the MSI x64 Linux Kernel.

### Install Debian
1. Open the Microsoft Store and select **Debian** distro
2. *Get* and **install** the application
3. Create a unix user account (ex. parrot) and password
4. Ensure that Debian is running on WSL 2

Powershell
``` cmd
wsl --list --verbose
wsl --set-version <distribution name> <versionNumber>
```
Success! You now have WSL2 and Debian installed :)
## Debian -> Parrot
Let's get to the fun stuff!
In your CLI, copy and paste to get the [parrot-install.sh](https://raw.githubusercontent.com/ParrotSec/alternate-install/master/parrot-install.sh)
Alternatively, copy the raw text if you don't trust me 
```  cmd
curl https://raw.githubusercontent.com/ParrotSec/alternate-install/master/parrot-install.sh -o parrot-install.sh
chmod a+x parrot-install.sh
sudo ./parrot-install.sh
```
### Select 1. Install Core Only
Why: This will get the correct sources.list for the parrot repositories.
I *highly* recommend this option!

Update works, but upgrade returns:
- 404 archives/packages not found

**Previous:** ``` /etc/apt/sources.list```
**New:** ``` /etc/apt/sources.list.d/* ```
> debian.list (empty)
> parrot.list (auto-generated)

### My parrot.list
``` python
deb https://deb.parrot.sh/parrot/ rolling main contrib non-free
#deb-src https://deb.parrot.sh/parrot/ rolling main contrib non-free
deb https://deb.parrot.sh/parrot/ rolling-security main contrib non-free
#deb-src https://deb.parrot.sh/parrot/ rolling-security main contrib non-free
```
You may use ANY mirror, but I the rolling release was the only successful endpoint for upgrading.

### Hash and Key Verification
Note: before you continue you must ensure you have the parrot-security key ring.
> [See Hash and Key Verification](https://docs.parrotlinux.org/info/verify-keys/)

When you enter *root* you should see the parrot CLI styling
![parrot-neofetch|690x318](https://community.parrotsec.org/uploads/default/original/2X/2/27a2aa28caa328ca348676da4debb0de03ae01bb.png)  

### To Upgrade
``` cmd
sudo su
parrot-upgrade
```
This will install all dependencies for the OS, and important packages, but no security tools, or GUI.
### Installing a GUI
``` cmd
apt-get install parrot-interface parrot-interface-full parrot-tools-full
```
### Installing Security Tools
``` cmd
apt -y --allow-downgrades install parrot-interface parrot-interface-full parrot-tools-full
```

### Before you continue
The GUI & RDP protocol can be extremely slow, and I have since switched to a live USB option.
> See [Live Encrypted Persistance USB](https://www.rzegocki.pl/blog/create-parrot-os-pendrive-with-encrypted-persistence-volume/)

I prefer to utilize my hardware and save files across on my drive.
However, this is a great proof of concept to allow you to have a GUI on Debian based WSL 2 linux distributions (like Kali Linux).

### To Access the GUI
As of now, we should have a WSL 2 instance with all of the bells and whistles.
So, to access this machine, we will use the onboard application, Remote Desktop Connection.

### LAN XRDP Server
This will create an access port on your Local Area Network through the WSL network adapter.
Allows you to connect to an operating system.
Note: You can only remote into a single WSL machine at a time (b/c they share an IP address)
```cmd
apt-get install xrdp
```
I created a bash file (rdp.sh) with
``` bash
#!/bin/bash
/etc/init.d/xrdp start
ip addr
```
### rdp.sh output

Side Note: I *recommend*  Windows Terminal (Preview) for WSL2 
![parrot-cli|690x386, 100%](https://community.parrotsec.org/uploads/default/original/2X/4/47d7fb1165b270d1a1206029b380328e8056d5b7.png)
Highlighted is the WSL LAN IP Address you are looking for.
Enter this into the RDC program and click *Connect*.
![RDP|207x274, 100%](https://community.parrotsec.org/uploads/default/original/2X/b/b2406cd79c13dfe9ff72a5f15b440159112cdde5.png) 
Once you enter the creds into the XRDP Server, you may now access the Parrot GUI.

And it works just like Kali Linux!!
![Parrot.PNG|690x388, 100%](https://community.parrotsec.org/uploads/default/optimized/2X/7/76e93baa2b68f6a5c3a98cf9686a30adf91dcf89_2_690x388.jpeg)