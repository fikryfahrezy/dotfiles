#!/bin/bash

echo "Run arch/install.sh"

FWD=`dirname "$0"`
CWD="$(pwd)/$FWD/"

# https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#Install_packages_from_a_list
sudo pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort $CWD/pkglist.txt))

sudo $CWD/ldf.sh $CWD/install.hook /etc/pacman.d/hooks/install.hook s
sudo $CWD/ldf.sh $CWD/pkglist.txt /etc/pacman.d/hooks/pkglist.txt s
sudo $CWD/ldf.sh $CWD/foreignpkglist.txt /etc/pacman.d/hooks/foreignpkglist.txt s

echo "Done running arch/install.sh"
