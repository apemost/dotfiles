#!/usr/bin/env bash
set -Eeuo pipefail

base_packages=(
  binutils
  curl
  neovim
  rsync
  screen
  tmux
  vim
  zsh
)

development_packages=(
  bubblewrap
  build-essential
  clang-format
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
  apache2-utils
  dnsutils
  ethtool
  iftop
  iperf3
  iputils-ping
  mtr
  net-tools
  netcat-openbsd
  network-manager
  nmap
  socat
  tshark
)

system_packages=(
  btop
  fatrace
  htop
  iotop
  pciutils
  strace
  usbutils
)

utility_packages=(
  autojump
  bat
  expect
  ffmpeg
  fzf
  gawk
  imagemagick
  jq
  latexmk
  markdown
  tree
  unar
  xclip
)

database_packages=(
  default-mysql-client
  percona-toolkit
  redis-tools
)

virtualization_packages=(
  qemu
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
  install_packages "${system_packages[@]}"
  install_packages "${database_packages[@]}"
  install_packages "${utility_packages[@]}"

  if confirm "Install virtualization tools?"; then
    install_packages "${virtualization_packages[@]}"
  fi

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
