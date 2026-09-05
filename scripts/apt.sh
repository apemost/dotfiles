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

# Describe the interactive defaults and options for automated installations.
usage() {
  cat <<'EOF'
Usage: apt.sh [options] [-- extra-package ...]

Install the six standard package groups. By default, prompt for virtualization
tools, GUI applications and fonts, then update, upgrade, install and autoremove.

Options:
  -y, --non-interactive       Automatically confirm APT operations and skip the
                              three optional groups. Use default debconf answers
                              and dpkg's default config-file action, keeping the
                              old file when there is no default. Requires root
                              or sudo access without a password prompt.
      --install-only          Skip upgrade and autoremove.
      --no-install-recommends Do not install recommended packages.
  -h, --help                  Show this help and exit.

Use -- to add explicit packages to the same installation.
EOF
}

# Prompt for confirmation. Returns success (0) only when the user answers
# y / Y / yes / YES (etc.); anything else (including empty / EOF) skips.
confirm() {
  local response
  read -r -p "$1 [y/N] " response || return 1
  [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
}

# Select package groups and install them with interactive or unattended options.
main() {
  local non_interactive=false install_only=false no_install_recommends=false
  local DEBIAN_FRONTEND="${DEBIAN_FRONTEND:-noninteractive}"
  local apt_command=(apt-get) install_command=(install)
  local packages=(
    "${base_packages[@]}"
    "${development_packages[@]}"
    "${network_packages[@]}"
    "${system_packages[@]}"
    "${database_packages[@]}"
    "${utility_packages[@]}"
  )

  while (($# > 0)); do
    case "$1" in
      -y|--non-interactive) non_interactive=true ;;
      --install-only) install_only=true ;;
      --no-install-recommends) no_install_recommends=true ;;
      -h|--help) usage; return 0 ;;
      --)
        shift
        packages+=("$@")
        break
        ;;
      *)
        printf 'Unknown argument: %s\n' "$1" >&2
        usage >&2
        return 2
        ;;
    esac
    shift
  done

  if "$non_interactive"; then
    DEBIAN_FRONTEND=noninteractive
  fi
  export DEBIAN_FRONTEND

  if [[ "$(id -u)" != "0" ]]; then
    if ! command -v sudo >/dev/null 2>&1; then
      echo "Run this script as root or install sudo for the current user." >&2
      return 1
    fi
    apt_command=(sudo)
    if "$non_interactive"; then
      apt_command+=(-n)
    fi
    apt_command+=("DEBIAN_FRONTEND=$DEBIAN_FRONTEND" apt-get)
  fi

  if "$non_interactive"; then
    apt_command+=(--assume-yes
      -o Dpkg::Options::=--force-confdef
      -o Dpkg::Options::=--force-confold)
  else
    if confirm "Install virtualization tools?"; then
      packages+=("${virtualization_packages[@]}")
    fi
    if confirm "Install GUI applications?"; then
      packages+=("${gui_packages[@]}")
    fi
    if confirm "Install fonts?"; then
      packages+=("${font_packages[@]}")
    fi
  fi

  if "$no_install_recommends"; then
    install_command+=(--no-install-recommends)
  fi

  "${apt_command[@]}" update
  if ! "$install_only"; then
    "${apt_command[@]}" upgrade
  fi
  "${apt_command[@]}" "${install_command[@]}" -- "${packages[@]}"
  if ! "$install_only"; then
    "${apt_command[@]}" autoremove
  fi
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  main "$@"
fi
