# dotfiles

[![Platform](https://img.shields.io/badge/platform-linux%20%7C%20macos-brightgreen.svg)](https://github.com/apemost/dotfiles)
[![PRs Welcome](https://img.shields.io/badge/pull%20requests-welcome-brightgreen.svg)](https://github.com/apemost/dotfiles/pulls)

Enhanced [Mathias Bynens](https://mathiasbynens.be)'s dotfiles + my [Vim configuration](https://github.com/apemost/vimrc).

![Screenshot of Vim](https://github.com/apemost/vimrc/blob/master/assets/vim.png)

## Installation

You can clone this repository wherever you want. To install, run command:

```bash
git clone https://github.com/apemost/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

## Usage

If you use bash by default, install zsh, and then:

```bash
chsh -s `which zsh`
```

To install vim plugins, run command:

```bash
vim +PlugInstall
```

## Vimrc

[See full documentation](https//github.com/apemost/vimrc)

## Recommended color schemes

- iTerm2

  - [Gruvbox Dark](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/schemes/Gruvbox%20Dark.itermcolors)
  - [Molokai](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/schemes/Molokai.itermcolors)

- macOS terminal

  - [Gruvbox Dark](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/terminal/Gruvbox%20Dark.terminal)
  - [Molokai](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/terminal/Molokai.terminal)

## License

[MIT](LICENSE)
