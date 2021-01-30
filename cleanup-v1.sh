#!/usr/bin/env bash
#
# SPDX-License-Identifier: GPL-3.0-or-later

echo "################################################################## "
tput setaf 2
echo "This file is kept here for continuity with the videos"
echo "We actually use the script in the folder installation-scripts"
echo "30 will first clean your cache and then build - downloads all packages"
echo "40 will reuse your cache and build - no download if you have the packages"
echo "Use the scripts in the folder installation-scripts instead"
echo "Do not run the scripts with sudo"
echo "But run it like this :"
echo "./30-build-the-iso-the-first-time.sh"
echo "or"
echo "./40-build-the-iso-local-again.sh"
echo "or else your iso will be in the /root folder"
echo "The clean up is done in the scripts."
tput sgr0
echo "################################################################## "
