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
sudo apt-get install -y shellcheck

# Install other useful binaries
sudo apt-get install -y cmus
sudo apt-get install -y htop
sudo apt-get install -y tmux
sudo apt-get install -y unrar

# Erase old downloaded archive files
sudo apt-get autoclean
