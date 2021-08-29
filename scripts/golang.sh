#!/bin/bash

echo "Running scripts/golang.sh"

GO_VER="1.16"

sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.16.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin

go version

echo "Done running scripts/golang.sh"
