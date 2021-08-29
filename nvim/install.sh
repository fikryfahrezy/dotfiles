#!/bin/bash

echo "Running nvim/install.sh"

FWD=`dirname "$0"`
CWD="$(pwd)/$FWD/"

# Install Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

chmod u+x $FWD/nvim.appimage
$FWD/nvim.appimage --appimage-extract

sudo mv squashfs-root /

sudo ln -s $CWD/squashfs-root/AppRun /usr/bin/nvim

sudo rm $HOME/.config/nvim/init.vim
sudo ln -s $CWD/init.vim $HOME/.config/nvim/init.vim

rm -rf $FWD/nvim.appimage
rm -rf $FWD/squashfs-root

nvim --version

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install COC
curl -sL install-node.now.sh/lts | bash

sudo rm $HOME/.config/nvim/coc-settings.json
sudo ln -s $CWD/coc-settings.json $HOME/.config/nvim/coc-settings.json

echo "Done running nvim/install.sh"
