#!/usr/bin/env bash
set -Eeuo pipefail

base_packages=(
  bash
  bash-completion@2
  binutils
  coreutils
  findutils
  gnu-sed
  gnupg
  grep
  moreutils
  neovim
  openssh
  screen
  tmux
  vim
  wget
  zsh
  zsh-completions
)

development_packages=(
  clang-format
  cmake
  devcontainer
  direnv
  fvm
  git
  git-lfs
  goenv
  pnpm
  prettier
  rustup
  shellcheck
  stylua
  uv
)

network_packages=(
  btop
  htop
  mtr
  nmap
  openvpn
  proxychains-ng
  socat
  ssh-copy-id
  telnet
  watch
  wrk
)

utility_packages=(
  aria2
  autojump
  bat
  ctags
  ctx7
  ffmpeg
  fzf
  gawk
  grpcurl
  helm
  hugo
  imagemagick
  jq
  kubernetes-cli
  llama.cpp
  markdown
  mycli
  mysql-client
  playwright-cli
  redis
  restish
  ripgrep
  starship
  svn
  taplo
  the_silver_searcher
  tlrc
  tree
  unar
  yq
)

# macOS-only formulae (unavailable or unnecessary on Linux)
macos_packages=(
  reattach-to-user-namespace
)

# Linux-only formulae
linux_packages=(
  nerdctl
)

gui_packages=(
  wireshark
)

font_packages=(
  font-hack
  font-hack-nerd-font
  font-maple-mono
  font-maple-mono-nf
  font-maple-mono-nf-cn
)

# Prompt for confirmation. Returns success (0) only when the user answers
# y / Y / yes / YES (etc.); anything else (including empty / EOF) skips.
confirm() {
  local response
  read -r -p "$1 [y/N] " response || return 1
  [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
}

# Platform detection helpers
is_macos() { [[ "$(uname -s)" == "Darwin" ]]; }
is_linux() { [[ "$(uname -s)" == "Linux" ]]; }

# Install a package group in one brew invocation; extra flags (e.g. --cask)
# may be passed before the package names.
install_packages() {
  (($# > 0)) || return 0
  brew install "$@"
}

# Install the standard Homebrew package set for this dotfiles environment.
main() {
  # Make sure we're using the latest Homebrew
  brew update

  # Upgrade any already-installed formulae
  brew upgrade

  install_packages "${base_packages[@]}"
  install_packages "${development_packages[@]}"
  install_packages "${network_packages[@]}"
  install_packages "${utility_packages[@]}"

  if is_macos; then
    install_packages "${macos_packages[@]}"
  fi

  if is_linux; then
    install_packages "${linux_packages[@]}"
  fi

  if is_macos && confirm "Install GUI applications?"; then
    install_packages --cask "${gui_packages[@]}"
  fi

  if is_macos && confirm "Install fonts?"; then
    install_packages --cask "${font_packages[@]}"
  fi

  # Remove outdated versions from the cellar
  brew cleanup
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  main "$@"
fi
