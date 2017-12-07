# Install command-line tools using Homebrew

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`
brew install coreutils

# Install some other useful utilities like `sponge`
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --with-default-names

# Install Bash
brew install bash
brew install bash-completion2

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

# Install `wget` with IRI support
brew install wget --with-iri

# Install more recent versions of some macOS tools
brew install grep
brew install openssh
brew install screen

# Install development environment
brew install git
brew install python
brew install python3
brew install cmake
brew install llvm --with-clang
brew install node

# Install some development tools
brew install ctags
brew install gnupg2
brew install htop
brew install httpie
brew install jq
brew install nvm
brew install pyenv
brew install shellcheck
brew install tmux
brew install vim --with-override-system-vi --with-python3

# Install other useful binaries
brew install autojump
brew install binutils
brew install ffmpeg
brew install markdown
brew install the_silver_searcher
brew install tree
brew install unrar

# Install fonts
brew cask install caskroom/fonts/font-hack

# Remove outdated versions from the cellar
brew cleanup
