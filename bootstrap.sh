#!/usr/bin/env bash

git pull origin main

rsync -avh --no-perms \
  .aliases \
  .curlrc \
  .editorconfig \
  .exports \
  .functions \
  .gdbinit \
  .gitconfig \
  .gitignore \
  .hushlogin \
  .inputrc \
  .myclirc \
  .remarkrc \
  .screenrc \
  .shellrc \
  .tmux.conf \
  .wgetrc \
  .zshrc \
  ~

if [[ $SHELL =~ 'zsh$' ]]; then
  source ~/.zshrc
fi
