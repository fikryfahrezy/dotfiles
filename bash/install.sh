#!/bin/bash

echo "Running bash/install.sh"

FWD=`dirname "$0"`
CWD="$(pwd)/$FWD/"

$CWD/ldf.sh $CWD/.bashrc $HOME/.bashrc

echo "Done running bash/install.sh"
