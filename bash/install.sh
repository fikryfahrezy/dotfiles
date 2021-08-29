#!/bin/bash

echo "Running bash/install.sh"

FWD=`dirname "$0"`

rm $HOME/.bashrc

ln -s $FWD/.bashrc $HOME/.bashrc


echo "Done running bash/install.sh"
