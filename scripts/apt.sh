#!/usr/bin/env bash
set -Eeuo pipefail

base_packages=(
  zsh
  binutils
  curl
  dnsutils
  iputils-ping
  neovim
  network-manager
  rsync
  screen
  tmux
  vim
)

development_packages=(
  build-essential
  cmake
  direnv
  g++
  gcc
  git
  git-lfs
  libpq-dev
  make
  python3-dev
  python3-venv
  ripgrep
  shellcheck
  silversearcher-ag
  universal-ctags
  zip
)

network_packages=(
  btop
  ethtool
  fatrace
  htop
  iftop
  iotop
  iperf3
  mtr
  net-tools
  netcat-openbsd
  nmap
  pciutils
  socat
  strace
  tshark
)

utility_packages=(
  apache2-utils
  autojump
  bat
  clang-format
  default-mysql-client
  expect
  ffmpeg
  fzf
  gawk
  imagemagick
  jq
  latexmk
  markdown
  percona-toolkit
  redis-tools
  tree
  xclip
)

gui_packages=(
  blender
  flameshot
  gimp
  meld
  pavucontrol-qt
  terminator
  vim-gtk
  wireshark
)

font_packages=(
  fonts-hack-ttf
  fonts-roboto
  fonts-droid-fallback
)

# Prompt for confirmation. Returns success (0) only when the user answers
# y / Y / yes / YES (etc.); anything else (including empty / EOF) skips.
confirm() {
  local response
  read -r -p "$1 [y/N] " response || return 1
  [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
}

# Ensure sudo exists before normal apt operations.
ensure_sudo() {
  if command -v sudo >/dev/null 2>&1; then
    return 0
  fi

  if [[ "$(id -u)" != "0" ]]; then
    echo "Run this script as root or install sudo for the current user." >&2
    return 1
  fi

  DEBIAN_FRONTEND="${DEBIAN_FRONTEND:-noninteractive}" apt-get update
  DEBIAN_FRONTEND="${DEBIAN_FRONTEND:-noninteractive}" apt-get install sudo
}

# Run apt-get through sudo.
run_apt() {
  sudo "DEBIAN_FRONTEND=${DEBIAN_FRONTEND:-noninteractive}" apt-get "$@"
}

# Install a package group in one apt-get invocation.
install_packages() {
  (($# > 0)) || return 0
  run_apt install "$@"
}

# Install the standard Debian package set for this dotfiles environment.
main() {
  ensure_sudo

  run_apt update
  run_apt upgrade

  install_packages "${base_packages[@]}"
  install_packages "${development_packages[@]}"
  install_packages "${network_packages[@]}"
  install_packages "${utility_packages[@]}"

  if confirm "Install GUI applications?"; then
    install_packages "${gui_packages[@]}"
  fi

  if confirm "Install fonts?"; then
    install_packages "${font_packages[@]}"
  fi

  run_apt autoremove
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  main "$@"
fi
