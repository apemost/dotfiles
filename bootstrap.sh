#!/usr/bin/env bash

git pull origin master
git submodule update --init --recursive

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

if [[ $1 == '--with-vimrc' ]]; then
  cd vimrc && source bootstrap.sh && cd -
fi

if [[ $SHELL =~ 'zsh$' ]]; then
  source ~/.zshrc
fi
