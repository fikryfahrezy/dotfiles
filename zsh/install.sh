#!/bin/bash

echo "Running zsh/install.sh"

FWD=`dirname "$0"`

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

rm $HOME/.zshrc

ls -s $FWD/.zshrc $HOME/.zshrc

echo "Done running zsh/install.sh"
