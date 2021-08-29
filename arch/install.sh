#!/bin/bash

echo "Run arch/install.sh"

FWD=`dirname "$0"`

# https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#Install_packages_from_a_list
pacman -S --needed - < $FWD/foreignpkglist.txt

sudo mkdir /etc/pacman.d/hooks

ls -s $FWD/install.hook /etc/pacman.d/hooks/install.hook

echo "Done running arch/install.sh"
