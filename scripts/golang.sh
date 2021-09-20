#!/bin/bash

echo "Running scripts/golang.sh"

FWD=`dirname "$0"`
CWD="$(pwd)/$FWD/"
GO_VER="1.17"
GO_PATH=/usr/local/go
PREV_VER=""

if [ -d "$GO_PATH" ]; then
  # Existing dir
  PREV_VER="$GO_PATH"
fi

wget -P "$CWD" -c https://golang.org/dl/go$GO_VER.linux-amd64.tar.gz

sudo rm -rf $GO_PATH
sudo tar -C /usr/local -xzf $CWD/go$GO_VER.linux-amd64.tar.gz

if [ -z $PREV_VER ]; then 
  echo "Fresh Install"
  export PATH=$PATH:$GO_PATH/bin
else
  echo "Updating GO"
fi

go version

rm -rf $CWD/go$GO_VER.linux-amd64.tar.gz

echo "Done running scripts/golang.sh"