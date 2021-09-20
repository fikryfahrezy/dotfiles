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
volta install javascript-typescript-langserver
volta install js-beautify
volta install neovim
volta install npkill
volta install pnpm
volta install prettier
volta install react-native
volta install typescript
volta install typescript-formatter
volta install typescript-language-server
volta install vercel
volta install vscode-css-languageserver-bin
volta install vscode-html-languageserver-bin

echo "Done running scripts/nodejs.sh"