#!/bin/bash

echo "Running bash/install.sh"

FWD=`dirname "$0"`
CWD="$(pwd)/$FWD/"

rm $HOME/.bashrc

ln -s $CWD/.bashrc $HOME/.bashrc

echo "Done running bash/install.sh"
