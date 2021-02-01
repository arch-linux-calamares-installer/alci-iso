# DEVELOPMENT

# Arch Linux Calamares Installer or ALCI

Use the correct version for building the iso.

**Read the archiso.md.**

Download the content of the github with (use the terminal)

`git clone https://github.com/arcolinuxiso/alci-iso`

# Pacman.conf in archiso

Only the archiso/pacman.conf will be used to download your packages.

We created several versions of pacman.conf to be able to switch quickly.

In order to avoid future questions we activated multilib by default on all except no-extra-pacman.conf.

In order to switch quickly we copy/paste the content of the other files in archiso/pacman.conf.

    arcolinux-chaotic-pacman.conf
        contains both ArcoLinux and chaotic-aur
        needs extra packages - mirrorlist and keys

    arcolinux-pacman.conf
        contains only ArcoLinux
        needs extra packages - mirrorlist and keys

    chaotic-pacman.conf
        contains only chaotic-aur
        needs extra packages - mirrorlist and keys

    no-extra-pacman.conf
        as vanilla as Arch Linux
        needs NO extra packages - mirrorlist and keys - no multilib

# Pacman.conf in archiso/airootfs/etc/

This will be your future system. 
Include the repositories you want.
It will not be used to build the iso.


# Keys and Mirrors

## ArcoLinux keys and mirror

Since this is an ArcoLinux project after all, the ArcoLinux keys are in by default.
Want a vanilla Arch Linux without any ArcoLinux packages then you do not need our keys.
Delete the ArcoLinux line in 
`/archiso/airootfs/etc/systemd/system/pacman-init.service`
and they will not be installed.

## Chaotic keys and mirror

If you want to include packages from the Chaotic-aur repo then add its packages to archiso/packages.x86-64.


# Archiso/packages.x86_64

Only the archiso/packages.x86-64 files will be used.

Check the bottom of the file and install the necessary packages

If you plan to use ArcoLinux packages

* arcolinux-keyring

* arcolinux-mirror

If you plan to use Chaotic packages

* chaotic-keyring

* chaotic-mirrorlist

Now you can add the packagename from the repo.

We have added a backup of the original file called original.packages.x86_64.
We have added an example called example-packages.x86_64.

Use meld to compare differences.

If you know you are going to need drivers for graphical cards or NICs put them on the iso.
I am thinking about xf86-video-intel, nvidia or other drivers.

# Build process

Install these two packages on your system if you want to include Chaotic packages on the iso

`sudo pacman -S chaotic-mirror chaotic-keyring`

Accept the **key of Pedro** from Chaotic during installation or install chaotic-keyring.

After editing the necessary files you can start building.

Use the scripts from this folder:

<b>installation-scripts</b>

Use script 30 and it will clean your pacman cache and redownload every package it needs.

Use script 40 to use your current pacman cache - it will only download what is needed

You will find the iso in this folder:

 ~/Alci-Out

Burn it with etcher or other tools and use it.

Still not sure what to do.

Check out the playlist on Youtube

https://www.youtube.com/playlist?list=PLlloYVGq5pS4vhYQuLikS8dhDjk6xaiXH


# Installation process

Is documented on 

https://www.arcolinuxiso.com/arch-linux-calamares-installer/


# After installation

We have added a script to activate your display manager by default.
If you reboot you will boot into a graphical environment.

If you install more than one display manager they will overrule each other.


If you are still in the terminal then activate the display manager of your choice manually.

`sudo systemctl enable gdm`

`sudo systemctl enable lightdm`

`sudo systemctl enable sddm`

Get the pacman databases in

`sudo pacman -Sy`

or update immediately

`sudo pacman -Syyu`


# Arch Linux users

In order to get the keys in from ArcoLinux and Chaotic.

ArcoLinux

Both packages are on github. Keys and mirrors.
https://github.com/arcolinuxiso/alci_repo/tree/master/x86_64
Download them and install them via pacman -U ...


Chaotic

Both packages are on the AUR. Keys and mirrors.


# Tip

Sometime a "proc" folder stays mounted.

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

When using gdm as display manager remember to delete the file /archiso/airootfs/etc/motd from your system. That files comes originally from Arch Linux.
To avoid waiting for every login and this nice look.
https://imgur.com/a/EvCN4pm


# Tip

Install networkmanager on the iso if you know you will need to use **nmtui** to connect to your wifi after bootup.
First stop Calamares with Super + Q. Then Super + Enter to have xterm. There you type nmtui and you connect to your wireless.

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
