#!/usr/bin/env bash

git pull origin master

rsync \
  --exclude '.git' \
  --exclude '.DS_Store' \
  --exclude '.travis.yml' \
  --exclude 'LICENSE' \
  --exclude 'README.md' \
  --exclude 'bootstrap.sh' \
  --exclude 'brew.sh' \
  --exclude 'macos.sh' \
  -avh --no-perms . ~

if [[ "$SHELL" =~ 'zsh$' ]]; then
  source ~/.zshrc
else
  source ~/.bashrc
fi
