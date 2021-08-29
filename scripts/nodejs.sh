#!/bin/bash

echo "Running scripts/nodejs.sh"

# install Volta
curl https://get.volta.sh | bash

# install Node
volta install node

echo "Done running scripts/nodejs.sh"
