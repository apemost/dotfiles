#!/usr/bin/env bash

# Install command-line tools using apt

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y curl
sudo apt-get install -y wget

# Install development tools
sudo apt-get install -y clang
sudo apt-get install -y cmake
sudo apt-get install -y git
sudo apt-get install -y gnupg2
sudo apt-get install -y python
sudo apt-get install -y python3
sudo apt-get install -y shellcheck

if ! which node &> /dev/null; then
  curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
  sudo apt-get install -y nodejs
fi

sudo apt-get install -y build-essential

# Install some CTF tools; see https://github.com/ctfs
sudo apt-get install -y aircrack-ng
sudo apt-get install -y binutils
sudo apt-get install -y binwalk
sudo apt-get install -y dns2tcp
sudo apt-get install -y fcrackzip
sudo apt-get install -y foremost
sudo apt-get install -y hydra
sudo apt-get install -y john
sudo apt-get install -y netpbm
sudo apt-get install -y nmap
sudo apt-get install -y pngcheck
sudo apt-get install -y socat
sudo apt-get install -y tcpflow
sudo apt-get install -y tcpreplay
sudo apt-get install -y tcptrace
sudo apt-get install -y ucspi-tcp # `tcpserver` etc.
sudo apt-get install -y xpdf

# Install other useful binaries
sudo apt-get install -y ack-grep
sudo apt-get install -y cmus
sudo apt-get install -y htop
sudo apt-get install -y lynx
sudo apt-get install -y pv
sudo apt-get install -y tmux
sudo apt-get install -y transmission-cli
sudo apt-get install -y wireshark

# Erase old downloaded archive files
sudo apt-get autoclean
