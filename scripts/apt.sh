#!/usr/bin/env bash

# Prompt for confirmation. Returns success (0) only when the user answers
# y / Y / yes / YES (etc.); anything else (including empty / EOF) skips.
confirm() {
  local response
  read -r -p "$1 [y/N] " response
  [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
}

sudo apt update

sudo apt upgrade

# Install Zsh
sudo apt install zsh

if ! fgrep -q '/usr/bin/zsh' /etc/shells; then
  echo '/usr/bin/zsh' | sudo tee -a /etc/shells
  chsh -s /usr/bin/zsh
fi

sudo apt install binutils
sudo apt install curl
sudo apt install dnsutils
sudo apt install iputils-ping
sudo apt install network-manager
sudo apt install rsync
sudo apt install screen
sudo apt install tmux
sudo apt install vim

# Install development environment
sudo apt install build-essential
sudo apt install cmake
sudo apt install g++
sudo apt install gcc
sudo apt install git
sudo apt install git-lfs
sudo apt install libpq-dev
sudo apt install make
sudo apt install python3-dev
sudo apt install ripgrep
sudo apt install silversearcher-ag
sudo apt install universal-ctags
sudo apt install zip

# Install other useful binaries
sudo apt install apache2-utils
sudo apt install autojump
sudo apt install bat
sudo apt install clang-format
sudo apt install expect
sudo apt install fatrace
sudo apt install ffmpeg
sudo apt install fzf
sudo apt install gawk
sudo apt install grip
sudo apt install htop
sudo apt install iftop
sudo apt install iotop
sudo apt install jq
sudo apt install latexmk
sudo apt install markdown
sudo apt install mtr
sudo apt install mysql-client
sudo apt install net-tools
sudo apt install nmap
sudo apt install parcellite
sudo apt install percona-toolkit
sudo apt install redis-tools
sudo apt install strace
sudo apt install tree
sudo apt install tshark
sudo apt install xclip

# Install GUI (requires confirmation)
if confirm "Install GUI applications?"; then
  sudo apt install blender
  sudo apt install flameshot
  sudo apt install gimp
  sudo apt install meld
  sudo apt install pavucontrol-qt
  sudo apt install terminator
  sudo apt install vim-gtk
  sudo apt install wireshark
fi

# Install fonts (requires confirmation)
if confirm "Install fonts?"; then
  sudo apt install fonts-hack-ttf
  sudo apt install fonts-roboto
  sudo apt install fonts-droid-fallback
fi

sudo apt autoremove
