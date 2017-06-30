#!/usr/bin/env bash

# Install command-line tools using apt

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y curl
sudo apt-get install -y wget

# Install development tools
sudo apt-get install -y build-essential
sudo apt-get install -y cmake
sudo apt-get install -y exuberant-ctags
sudo apt-get install -y git
sudo apt-get install -y git-extras
sudo apt-get install -y gnupg2
sudo apt-get install -y htop
sudo apt-get install -y httpie
sudo apt-get install -y shellcheck
sudo apt-get install -y tmux

# Install other useful binaries
sudo apt-get install -y cmus
sudo apt-get install -y silversearcher-ag
sudo apt-get install -y tree
sudo apt-get install -y unrar

# Erase old downloaded archive files
sudo apt-get autoclean
