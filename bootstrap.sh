#!/usr/bin/env bash

cd "$(dirname "$BASH_SOURCE")"

git pull origin master

function rsync_linux() {
  rsync --exclude ".git/" \
    --exclude ".DS_Store" \
    --exclude ".mac" \
    --exclude ".macos" \
    --exclude "brew.sh" \
    --exclude "bootstrap.sh" \
    --exclude "README.md" \
    --exclude "LICENSE" \
    -avh --no-perms . ~
}

function rsync_darwin() {
  rsync --exclude ".git/" \
    --exclude ".DS_Store" \
    --exclude "apt.sh" \
    --exclude "bootstrap.sh" \
    --exclude "README.md" \
    --exclude "LICENSE" \
    -avh --no-perms . ~
}

function bootstrap() {
  local platform="$(uname -s)"

  if [ "$platform" == "Linux" ]; then
    rsync_linux
  elif [ "$platform" == "Darwin" ]; then
    rsync_darwin
  else
    echo "My dotfiles are not supported yet on this platform ($platform)."
    exit 1
  fi

  source ~/.bash_profile
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  bootstrap
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    bootstrap
  fi
fi

unset rsync_linux
unset rsync_darwin
unset bootstrap
