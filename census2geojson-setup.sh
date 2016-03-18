#!/usr/bin/env bash

NVM_DIR="$HOME/.nvm"
if [ -f "$NVM_DIR/nvm.sh" ]; then
  . "$NVM_DIR/nvm.sh"
fi

if [ -f "$HOME/.bash_profile" ]; then
  touch "$HOME/.bash_profile"
fi

if ! type nvm &> /dev/null; then
  echo "Installing NVM"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
  [ -s "$NVM_DIR/nvm.sh"  ] && . "$NVM_DIR/nvm.sh" # This loads nvm
  nvm install 5.0
else
  echo 'nvm already installed'
fi

if ! type togeojson &> /dev/null; then
  echo "Installing togeojson"
  npm i -g togeojson
else
  echo 'togeojson already installed'
fi

if ! type geojson-merge &> /dev/null; then
  echo "Installing geojson-merge"
  npm i -g geojson-merge
else
  echo 'geojson-merge already installed'
fi
