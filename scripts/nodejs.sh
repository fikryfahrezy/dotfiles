#!/bin/bash

echo "Running scripts/nodejs.sh"

# install Volta
curl https://get.volta.sh | bash

# install Node
volta install node

# install other tools via Volta
volta install create-next-app
volta install depcheck
volta install eslint
volta install http-server
volta install importjs
volta install js-beautify
volta install neovim
volta install npkill
volta install pnpm
volta install react-native
volta install typescript
volta install typescript-formatter
volta install vercel

echo "Done running scripts/nodejs.sh"
