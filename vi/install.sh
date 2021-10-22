#!/bin/bash

echo "Running n-vim/install.sh"

FWD=`dirname "$0"`
CWD="$(pwd)/$FWD/"

# Install Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

chmod u+x $FWD/nvim.appimage
$FWD/nvim.appimage --appimage-extract

sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

$CWD/ldf.sh $CWD/nvim.vim $HOME/.config/nvim/init.vim s

rm -rf $FWD/nvim.appimage
rm -rf $FWD/squashfs-root

nvim --version

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# link COC setting
$CWD/ldf.sh $CWD/coc-settings.json $HOME/.config/nvim/coc-settings.json s

# Install SpaceVim
curl -sLf https://spacevim.org/install.sh | bash

# Link SpaceVim Config
$CWD/ldf.sh $CWD/spacevim.toml $HOME/.SpaceVim.d/init.toml s
$CWD/ldf.sh $CWD/myspacevim.vim $HOME/.SpaceVim.d/autoload/myspacevim.vim s
$CWD/ldf.sh $CWD/coc-settings.json $HOME/.SpaceVim/coc-settings.json s
$CWD/ldf.sh $CWD/coc.vim $HOME/.SpaceVim.d/plugin/coc.vim s

echo "Done running n-vim/install.sh"
