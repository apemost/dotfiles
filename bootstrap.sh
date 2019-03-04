#!/usr/bin/env bash

git pull origin master
git submodule update --init --recursive

rsync \
  --exclude '.DS_Store' \
  --exclude '.git' \
  --exclude '.gitmodules' \
  --exclude '.minttyrc' \
  --exclude 'LICENSE' \
  --exclude 'README.md' \
  --exclude 'apt.sh' \
  --exclude 'bootstrap.sh' \
  --exclude 'brew.sh' \
  --exclude 'macos.sh' \
  --exclude 'npm.sh' \
  --exclude 'vimrc' \
  -avh --no-perms . ~

cd vimrc && source bootstrap.sh && cd -

if [[ "$SHELL" =~ 'zsh$' ]]; then
  source ~/.zshrc
else
  source ~/.bashrc
fi
