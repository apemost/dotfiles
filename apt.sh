# Install command-line tools using apt

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y curl
sudo apt-get install -y wget

sudo apt-get install -y zsh

if [ "$SHELL" != '/usr/bin/zsh' ]; then
  chsh -s /usr/bin/zsh
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Install development environment
sudo apt-get install -y git
sudo apt-get install -y git-extras
sudo apt-get install -y python
sudo apt-get install -y python3
sudo apt-get install -y cmake
sudo apt-get install -y clang-3.9
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential

# Install development tools
sudo apt-get install -y exuberant-ctags
sudo apt-get install -y gnupg2
sudo apt-get install -y htop
sudo apt-get install -y httpie
sudo apt-get install -y jq
sudo apt-get install -y shellcheck
sudo apt-get install -y tmux
sudo apt-get install -y vim

# Install other useful binaries
sudo apt-get install -y silversearcher-ag
sudo apt-get install -y tree
sudo apt-get install -y unrar

# Erase old downloaded archive files
sudo apt-get autoclean
