#!/usr/bin/env bash

# Install command-line tools using apt

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install curl
sudo apt-get install wget

# Install development tools
sudo apt-get install git
sudo apt-get install gnupg2
sudo apt-get install lua
sudo apt-get install python
sudo apt-get install python3

# Install other useful binaries
sudo apt-get install tmux