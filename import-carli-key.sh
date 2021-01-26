#!/bin/bash
#set -e
##################################################################################################################
# Author 	: 	Erik Dubois
# Website 	: 	https://www.erikdubois.be
# Website	:	https://www.arcolinux.info
# Website	:	https://www.arcolinux.com
# Website	:	https://www.arcolinuxd.com
# Website	:	https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

echo "get the carli key in"
sudo pacman-key --recv-keys 7B01FA17CA801345 --keyserver hkp://ipv4.pool.sks-keyservers.net:11371

echo "Lsign the keys"
sudo pacman-key --lsign-key 7B01FA17CA801345

echo "################################################################"
echo "###################        Done           ######################"
echo "################################################################"
