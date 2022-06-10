#!/bin/bash
#
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	Erik Dubois
# Website 	: 	http://www.erikdubois.be
##################################################################################################################
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

echo "This gets all the existing githubs at once"
echo "Fill the array with the original folders first"

# use ls -d */ > list to get the list of the created githubs and copy/paste in

directories=(
alci-calamares-config/
alci-calamares-config-dev/
alci-calamares-config-hardened/
alci-calamares-config-lts/
alci-calamares-config-pure/
alci-calamares-config-xanmod-edge/
alci-calamares-config-zen/
alci-dwm/
alci-dwm-nemesis/
alci-iso/
alci-iso-dev/
alci-iso-hardened/
alci-iso-lts/
alci-iso-pure/
alci-iso-xanmod-edge/
alci-iso-zen/
alci-pkgbuild/
alci_repo/
nemesis-wallpapers/
)

count=0

for name in "${directories[@]}"; do
	count=$[count+1]
	tput setaf 1;echo "Github "$count;tput sgr0;
	# if there is no folder then make one
	git clone https://github.com/arch-linux-calamares-installer/$name
	echo "#################################################"
	echo "################  "$(basename `pwd`)" done"
	echo "#################################################"
done
