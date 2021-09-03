#!/bin/bash

# https://github.com/victoriadrake/dotfiles/blob/ubuntu-19.10/scripts/symlink.sh
src="$1"
dest="$2"
dateStr=$(date +%Y-%m-%d-%H%M)

if [[ ! -z "$1" && ! -z "$2" ]]
then

  if [ -h "${dest}" ]; then
    # Existing symlink 
    echo "Removing existing symlink: ${dest}"
    rm ${dest} 
  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}
  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  if [ ! -d "${dest%/*}" ]; then 
    echo "Creating dir for: ${dest}"
    mkdir "${dest%/*}"
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${src} ${dest}

else
  echo "args 1 (src) & 2 (dest) required"
fi

