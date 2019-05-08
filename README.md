# dotfiles

[![Platform](https://img.shields.io/badge/platform-linux%20%7C%20macos-brightgreen.svg)](https://github.com/apemost/dotfiles)
[![PRs Welcome](https://img.shields.io/badge/pull%20requests-welcome-brightgreen.svg)](https://github.com/apemost/dotfiles/pulls)

Enhanced [Mathias](https://mathiasbynens.be)'s dotfiles,
sensible hacker defaults for macOS and Ubuntu.

**Warning:**
If you want to give these dotfiles a try, you should first fork this
repository, review the code, and remove things you don’t want or need. Don’t
blindly use my settings unless you know what that entails.
Use at your own risk!

## Installation

You can clone this repository wherever you want. The bootstrapper script will
pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/apemost/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to install or update with my [Vim configuration](https://github.com/apemost/vimrc):

```bash
source bootstrap.sh --with-vimrc
```

## Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can
use this to add a few custom commands without the need to fork this entire
repository, or to add commands you don’t want to commit to a public repository.

## Usage

If you use bash by default, install zsh, and then:

```bash
chsh -s `which zsh`
```

To install vim plugins:

```bash
vim +PlugInstall
```

## Vimrc

You can find all the documentation [here](https://github.com/apemost/vimrc).

## Recommended color schemes

- iTerm2

  - [Gruvbox Dark](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/schemes/Gruvbox%20Dark.itermcolors)
  - [Molokai](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/schemes/Molokai.itermcolors)

- macOS terminal

  - [Gruvbox Dark](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/terminal/Gruvbox%20Dark.terminal)
  - [Molokai](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/terminal/Molokai.terminal)

## Feedback

Suggestions/improvements [welcome](https://github.com/apemost/dotfiles/issues)!

## License

[MIT](LICENSE)
