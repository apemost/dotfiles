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

Alternatively, to install or update with [Andrew's vimrc](https://github.com/apemost/vimrc):

```bash
source bootstrap.sh --with-vimrc
```

## FAQ

### How to add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can
use this to add a few custom commands without the need to fork this entire
repository, or to add commands you don’t want to commit to a public repository.

### How to install and set up zsh as default

See <https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH>.

### How to install vim plugins via [vim-plug](https://github.com/junegunn/vim-plug):

```bash
vim +PlugInstall
```

### Are there any docs for Andrew's vimrc

You can find all the documentation [here](https://github.com/apemost/vimrc).

## Recommended color schemes

| Color Scheme | Terminal                                                                                                                                                                                                          |
| ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Gruvbox Dark | [iTerm2](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/schemes/Gruvbox%20Dark.itermcolors), [Terminal](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/schemes/Molokai.itermcolors) |
| Molokai      | [iTerm2](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/terminal/Gruvbox%20Dark.terminal), [Terminal](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/terminal/Molokai.terminal)     |

Alternatively, you can find over 200 terminal color schemes/themes [here](https://github.com/mbadolato/iTerm2-Color-Schemes)
for iTerm/iTerm2, Terminal, Konsole, PuTTY, Xresources, XRDB, Remina, Termite,
XFCE, Tilda, FreeBSD VT, Terminator, Kitty, and MobaXterm.

## Feedback

Suggestions/improvements [welcome](https://github.com/apemost/dotfiles/issues)!

## License

[MIT](LICENSE)
