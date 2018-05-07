#!/usr/bin/env bash

git pull origin master
git submodule update --init --recursive

rsync \
  --exclude '.git' \
  --exclude '.gitmodules' \
  --exclude '.DS_Store' \
  --exclude 'LICENSE' \
  --exclude 'README.md' \
  --exclude 'bootstrap.sh' \
  --exclude 'brew.sh' \
  --exclude 'macos.sh' \
  --exclude 'macos.sh' \
  --exclude 'vimrc' \
  -avh --no-perms . ~

cd vimrc && source bootstrap.sh && cd -

if [[ "$SHELL" =~ 'zsh$' ]]; then
  source ~/.zshrc
else
  source ~/.bashrc
fi
