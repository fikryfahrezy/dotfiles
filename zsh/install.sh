#!/bin/bash

echo "Running zsh/install.sh"

FWD=`dirname "$0"`
CWD="$(pwd)/$FWD/"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

$CWD/ldf.sh $CWD/.zshrc $HOME/.zshrc s

echo "Done running zsh/install.sh"