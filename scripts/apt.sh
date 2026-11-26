#!/usr/bin/env bash
set -Eeuo pipefail

base_packages=(
  binutils
  ca-certificates
  curl
  git
  locales
  make
  rsync
  screen
  tmux
  vim
  wget
  zip
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
  gh
  git-lfs
  glab
  libpq-dev
  neovim
  python3-dev
  python3-venv
  ripgrep
  shellcheck
  silversearcher-ag
  starship
  universal-ctags
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
  mtools
  nvtop
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
  tree-sitter-cli
  unar
  xclip
)

database_packages=(
  default-mysql-client
  percona-toolkit
  redis-tools
)

virtualization_packages=(
  ovmf
  qemu-efi-aarch64
  qemu-system-arm
  qemu-system-x86
  qemu-utils
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

By default, select the six standard package groups and prompt for virtualization
tools, GUI applications and fonts, then update, upgrade, install and autoremove.

Options:
      --groups GROUPS         Select comma-separated groups and skip group prompts.
  -y, --non-interactive       Automatically confirm APT operations and skip
                              group prompts. Use default debconf answers
                              and dpkg's default config-file action, keeping the
                              old file when there is no default. Requires root
                              or sudo access without a password prompt.
      --install-only          Skip upgrade and autoremove.
      --no-install-recommends Do not install recommended packages.
  -h, --help                  Show this help and exit.

Available groups are base, development, network, system, database, utility,
virtualization, gui and font. Use -- to add explicit packages to the same
installation.
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
  local select_groups=false group_list group
  local DEBIAN_FRONTEND="${DEBIAN_FRONTEND:-noninteractive}"
  local apt_command=(apt-get) install_command=(install) packages=()

  while (($# > 0)); do
    case "$1" in
      --groups)
        if [[ -z "${2:-}" || "$2" == -* ]]; then
          printf '%s requires a comma-separated list of package groups.\n' "$1" >&2
          return 2
        fi
        # Keep empty group names visible, including after a trailing comma.
        group_list="$2,"
        while [[ -n "$group_list" ]]; do
          group=${group_list%%,*}
          group_list=${group_list#*,}
          case "$group" in
            base) packages+=("${base_packages[@]}") ;;
            development) packages+=("${development_packages[@]}") ;;
            network) packages+=("${network_packages[@]}") ;;
            system) packages+=("${system_packages[@]}") ;;
            database) packages+=("${database_packages[@]}") ;;
            utility) packages+=("${utility_packages[@]}") ;;
            virtualization) packages+=("${virtualization_packages[@]}") ;;
            gui) packages+=("${gui_packages[@]}") ;;
            font) packages+=("${font_packages[@]}") ;;
            *)
              printf 'Unknown package group: %q\n' "$group" >&2
              return 2
              ;;
          esac
        done
        select_groups=true
        shift
        ;;
      -y|--non-interactive) non_interactive=true ;;
      --install-only) install_only=true ;;
      --no-install-recommends) no_install_recommends=true ;;
      -h|--help) usage; return 0 ;;
      --)
        shift
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

  if ! "$select_groups"; then
    packages=(
      "${base_packages[@]}"
      "${development_packages[@]}"
      "${network_packages[@]}"
      "${system_packages[@]}"
      "${database_packages[@]}"
      "${utility_packages[@]}"
    )
  fi
  packages+=("$@")

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
  elif ! "$select_groups"; then
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
