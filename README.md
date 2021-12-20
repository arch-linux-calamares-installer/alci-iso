# ALCI STABLE

# Arch Linux Calamares Installer or ALCI

Use the correct version of Archiso to build the iso.

**Read the archiso.md.**

Download the content of the github with (use the terminal)

`git clone https://github.com/arch-linux-calamares-installer/alci-iso`

# Pacman.conf in archiso folder

Only the archiso/pacman.conf will be used to download your packages.

You can activate more sources besides Arch Linux repos

    arcolinux
    chaotic
    your own local repo



# Pacman.conf in archiso/airootfs/etc/

This will be your future system. 
Include the repositories you want.
It will not be used to build the iso.


# Keys and Mirrors

## ArcoLinux keys and mirror

Add the ArcoLinux keys and Arcolinux mirrors to the packages.x86_64.
The pacman-init service  at etc/systemd/system/pacman-init.service will add any keys present.


## Chaotic keys and mirror

Add the Chaotic keys and Chaotic mirrors to the packages.x86_64.
The pacman-init service  at etc/systemd/system/pacman-init.service will add any keys present.


# Archiso/packages.x86_64

Only the archiso/packages.x86-64 files will be used.

Add more packages at the bottom of the file

If you plan to use ArcoLinux packages

* arcolinux-keyring

* arcolinux-mirror

If you plan to use Chaotic packages

* chaotic-keyring

* chaotic-mirrorlist

You can even add packages from your own personal local repo.


If you know you are going to need drivers for graphical cards or NICs put them on the iso.
I am thinking about xf86-video-intel, nvidia or other drivers.

# Build process

Install these two packages on your system if you want to include **Chaotic packages** on the iso

`sudo pacman -S chaotic-mirrorlist chaotic-keyring`

If not on ArcoLinux you can install them from AUR.


Install these two packages on your system if you want to include **ArcoLinux packages** on the iso

`sudo pacman -S arcolinux-mirrorlist-git arcolinux-keyring`

If not on ArcoLinux you can download the package from the alci_repo with sudo pacman -U.

https://github.com/arch-linux-calamares-installer/alci_repo


After editing the necessary files (pacman.conf and packages.x86_64) you can start building.

Use the scripts from this folder:

<b>installation-scripts</b>

Use script 30 and it will clean your pacman cache and redownload every package it needs.

Use script 40 to use your current pacman cache - it will only download what is needed.

You will find the iso in this folder:

 ~/Alci-Iso-Out

Burn it with etcher or other tools and use it.

Still not sure what to do.

Check out the playlist on Youtube

https://www.youtube.com/playlist?list=PLlloYVGq5pS4vhYQuLikS8dhDjk6xaiXH


# Installation process

Is documented on 

https://www.alci.online


# After installation

We have added a script to activate your display manager by default.
If you reboot you will boot into a graphical environment.

If you did not install a desktop environment on the iso you can still do so by going to 
TTY and installing one. SDDM stays after installation.

If you install more than one display manager they will overrule each other. SDDM will always lose
to gdm, lightdm or lxdm.


If you are still in the terminal then activate the display manager of your choice manually.

`sudo systemctl enable gdm`

`sudo systemctl enable lightdm`

`sudo systemctl enable sddm`

`sudo systemctl enable lxdm`

Get the pacman databases in

`sudo pacman -Sy`

or update immediately

`sudo pacman -Syyu`


# Tip

Sometimes a "proc" folder stays mounted.

Unmount it with this

sudo umount /home/{username}/...  use the TAB


# Tip

We have added a /etc/pacman-more.conf file to your future system.
That way we have the ArcoLinux repos and Chaotic repos if we do decide to install it after all.
Remember to install the mirror and keys.


# Tip

Run into issues - remove all packages manually with

`sudo pacman -Scc`

and ensure they are all gone.


# Tip

When testing out the ALCI in virtualbox, you can use the alias 
evb to enable and start virtualbox. As a result you can use your full resolution.



# Tip

When using gdm as display manager remember to delete the file /archiso/airootfs/etc/motd from your system. That files comes originally from Arch Linux.
To avoid waiting for every login and this nice look.
https://imgur.com/a/EvCN4pm


# Tip

Internet is NOT required for ALCI. Calamares is only using the internet to check where you live to put the red dot correctly on the world map (geoip). Calamares will **not download anything**. 

The list you created in the packages.x86_64 file will be installed on the iso and on your future system.

On demand of our users we have added 3 links to the archiso folder so that in the live environment they will have network manager.

/archiso/airootfs/etc/systemd/system/multi-user.target.wants/NetworkManager.service
/archiso/airootfs/etc/systemd/system/network-online.target.wants/NetworkManager-wait-online.service
/archiso/airootfs/etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service

If you do not use Networkmanager, you can delete them. You can also keep them as they are pointing to services you have not installed. The links will have no effect at all.

Remember there is still **nmtui** if the gui Networkmanager fails you in some way.

If you did NOT install it on the iso. These are the steps you can still do.

`setxkbmap be  - I will set my keyboard to azerty`


`sudo pacman -Sy - get the pacman databases in`


`sudo pacman -S networkmanager - installing the software`


`sudo systemctl enable NetworkManager - mind the capital letters`


`sudo systemctl start NetworkManager`


`nmtui`

Then connect to the wifi.

Then we restart Calamares.

`sudo calamares`
