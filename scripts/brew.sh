#!/usr/bin/env bash

# Prompt for confirmation. Returns success (0) only when the user answers
# y / Y / yes / YES (etc.); anything else (including empty / EOF) skips.
confirm() {
  local response
  read -r -p "$1 [y/N] " response
  [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
}

# Platform detection helpers
is_macos() { [[ "$(uname -s)" == "Darwin" ]]; }
is_linux() { [[ "$(uname -s)" == "Linux" ]]; }

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

# Install `wget`
brew install wget

# Install more recent versions of some macOS tools
brew install grep
brew install neovim
brew install openssh
brew install screen
brew install tmux
brew install vim

# macOS pasteboard access under tmux and screen. macOS-only: this formula
# relies on macOS-specific APIs and is unavailable on Linux.
if is_macos; then
  brew install reattach-to-user-namespace
fi

# Install development environment
brew install clang-format
brew install cmake
brew install devcontainer
brew install direnv
brew install fvm
brew install git
brew install git-lfs
brew install goenv
brew install pnpm
brew install prettier
brew install rustup
brew install shellcheck
brew install stylua
brew install uv

# Install system and network utilities
brew install btop
brew install htop
brew install mtr
brew install nmap
brew install openvpn
brew install proxychains-ng
brew install socat
brew install ssh-copy-id
brew install telnet
brew install watch
brew install wrk

# Install other useful binaries
brew install autojump
brew install bat
brew install ctags
brew install ctx7
brew install ffmpeg
brew install fzf
brew install gawk
brew install grip
brew install grpcurl
brew install helm
brew install imagemagick
brew install jq
brew install kubernetes-cli
brew install llama.cpp
brew install markdown
brew install mycli
brew install mysql-client
brew install playwright-cli
brew install redis
brew install restish
brew install ripgrep
brew install starship
brew install svn
brew install taplo
brew install the_silver_searcher
brew install tlrc
brew install tree
brew install unrar
brew install yq

# Linux only
if is_linux; then
  brew install nerdctl
fi

# Install GUI applications (requires confirmation; macOS only)
if is_macos && confirm "Install GUI applications?"; then
  brew install --cask wireshark
fi

# Install fonts (requires confirmation; macOS only)
if is_macos && confirm "Install fonts?"; then
  brew install --cask font-hack
  brew install --cask font-hack-nerd-font
  brew install --cask font-maple-mono
  brew install --cask font-maple-mono-nf
  brew install --cask font-maple-mono-nf-cn
fi

# Remove outdated versions from the cellar
brew cleanup
