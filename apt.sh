#!/usr/bin/env bash

# Install command-line tools using apt

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install curl
sudo apt-get install wget

# Install development tools
sudo apt-get install git
sudo apt-get install gnupg2
sudo apt-get install python
sudo apt-get install python3

# Install some CTF tools; see https://github.com/ctfs
sudo apt-get install aircrack-ng
sudo apt-get install binutils
sudo apt-get install binwalk
sudo apt-get install dns2tcp
sudo apt-get install fcrackzip
sudo apt-get install foremost
sudo apt-get install hydra
sudo apt-get install john
sudo apt-get install netpbm
sudo apt-get install nmap
sudo apt-get install pngcheck
sudo apt-get install socat
sudo apt-get install tcpflow
sudo apt-get install tcpreplay
sudo apt-get install tcptrace
sudo apt-get install ucspi-tcp # `tcpserver` etc.
sudo apt-get install xpdf

# Install other useful binaries
sudo apt-get install ack-grep
sudo apt-get install cmus
sudo apt-get install lynx
sudo apt-get install pv
sudo apt-get install tmux

# Erase old downloaded archive files
sudo apt-get autoclean