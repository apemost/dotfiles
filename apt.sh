#!/usr/bin/env bash

sudo apt update

sudo apt upgrade

# Install GnuPG to enable PGP-signing commits
sudo apt install gnupg

# Install Zsh
sudo apt install zsh

if ! fgrep -q '/usr/bin/zsh' /etc/shells; then
  echo '/usr/bin/zsh' | sudo tee -a /etc/shells
  chsh -s /usr/bin/zsh
fi

sudo apt install screen
sudo apt install tmux

# Install development environment
sudo apt install cmake
sudo apt install git
sudo apt install git-lfs
sudo apt install ctags
sudo apt install silversearcher-ag
sudo apt install ripgrep  # Require Ubuntu Cosmic (18.10) or newer

# Install other useful binaries
sudo apt install autojump
sudo apt install clang-format
sudo apt install ffmpeg
sudo apt install grip
sudo apt install htop
sudo apt install jq
sudo apt install markdown
sudo apt install nmap

sudo apt autoremove
