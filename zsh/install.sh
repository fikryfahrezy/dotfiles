#!/bin/bash

echo "Running zsh/install.sh"

FWD=`dirname "$0"`
CWD="$(pwd)/$FWD/"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

rm $HOME/.zshrc

ls -s $CWD/.zshrc $HOME/.zshrc

echo "Done running zsh/install.sh"
