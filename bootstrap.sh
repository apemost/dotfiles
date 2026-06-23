#!/usr/bin/env bash

has_uncommitted_changes() {
  [[ -n "$(git status --porcelain --untracked-files=no 2>/dev/null)" ]]
}

if has_uncommitted_changes; then
  echo "Skipped git pull because there are uncommitted changes."
else
  git pull origin main
fi

rsync -avh --no-perms \
  .aliases \
  .curlrc \
  .editorconfig \
  .exports \
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
