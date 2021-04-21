#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils

# Install some other useful utilities like `sponge`
brew install binutils
brew install moreutils

# Install GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed

# Install GnuPG to enable PGP-signing commits
brew install gnupg

# Install Bash
brew install bash
brew install bash-completion@2

# Install Zsh
brew install zsh
brew install zsh-completions

if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells
fi

if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/zsh
fi

# Install `wget`
brew install wget

# Install more recent versions of some macOS tools
brew install vim
brew install grep
brew install openssh
brew install screen
brew install tmux

# Mac OS X pasteboard access under tmux and screen
brew install reattach-to-user-namespace

# Install development environment
brew install cmake
brew install git
brew install git-lfs
brew install ctags
brew install ripgrep
brew install the_silver_searcher

# Install other useful binaries
brew install autojump
brew install bat
brew install clang-format
brew install ffmpeg
brew install gawk
brew install grip
brew install htop
brew install jq
brew install markdown
brew install nmap
brew install openvpn
brew install proxychains-ng
brew install ssh-copy-id
brew install svn
brew install tree
brew install unrar
brew install watch
brew install wrk

# Install fonts
brew tap homebrew/cask-fonts
brew install --cask font-hack
brew install --cask font-fira-code
brew install --cask font-monofur-for-powerline

# Remove outdated versions from the cellar
brew cleanup
