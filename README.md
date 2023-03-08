# dotfiles

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/00eb6b601f194b6c98c31e51de5f8bad)](https://app.codacy.com/manual/apemost/dotfiles?utm_source=github.com&utm_medium=referral&utm_content=apemost/dotfiles&utm_campaign=Badge_Grade_Dashboard)
[![Build Status](https://github.com/apemost/dotfiles/workflows/build/badge.svg)](https://github.com/apemost/dotfiles/actions?query=workflow%3Abuild)
[![Platform](https://img.shields.io/badge/platform-linux%20%7C%20macos-brightgreen.svg)](https://github.com/apemost/dotfiles)
[![PRs Welcome](https://img.shields.io/badge/pull%20requests-welcome-brightgreen.svg)](https://github.com/apemost/dotfiles/pulls)

Enhanced [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles),
sensible hacker defaults for Linux and macOS.

**Warning:**  
If you want to give these dotfiles a try, you should first fork this
repository, review the code, and remove things you don’t want or need. Don’t
blindly use my settings unless you know what that entails.
Use at your own risk!

## Trying with Docker

```bash
docker run -it --rm apemost/dotfiles
```

## Requirements

- `zsh`: version 4.3.9 or higher
- `git`: version 1.7 or higher

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

### pyenv

> Simple Python version management

```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
```

### goenv

> Like pyenv and rbenv, but for Go

```bash
git clone https://github.com/syndbg/goenv.git ~/.goenv
```

### nvm

> Node Version Manager - Simple bash script to manage multiple active node.js versions

```bash
mkdir -p ~/.nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
```

### SDKMAN!

> The Software Development Kit Manager

```bash
curl -s https://get.sdkman.io | bash
```

## FAQ

### How to add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can
use this to add a few custom commands without the need to fork this entire
repository, or to add commands you don’t want to commit to a public repository.

You could also use `~/.extra` to override settings, functions and aliases from
my dotfiles repository. It’s probably better to [fork this repository](https://github.com/apemost/dotfiles/fork)
instead, though.

### How to install and set up zsh as default

See <https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH>.

## Recommended terminal color schemes/themes

| Color Scheme | Terminal                                                                                                                                                                                                               |
| ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Gruvbox Dark | [iTerm2](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/schemes/Gruvbox%20Dark.itermcolors), [Terminal](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/terminal/Gruvbox%20Dark.terminal) |
| Molokai      | [iTerm2](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/schemes/Molokai.itermcolors), [Terminal](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/terminal/Molokai.terminal)               |

Alternatively, you can find over 200 terminal color schemes/themes [here](https://github.com/mbadolato/iTerm2-Color-Schemes)
for iTerm/iTerm2, Terminal, Konsole, PuTTY, Xresources, XRDB, Remina, Termite,
XFCE, Tilda, FreeBSD VT, Terminator, Kitty, and MobaXterm.

## Feedback

Suggestions/improvements [welcome](https://github.com/apemost/dotfiles/issues)!

## License

[MIT](LICENSE)
