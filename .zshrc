[ -n "$PS1" ] && source ~/.shellrc

# Set name of the theme to load
ZSH_THEME='spaceship'

# `_` and `-` will be interchangeable
HYPHEN_INSENSITIVE="true"

# Display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Load plugins
plugins=(autojump git pip tmux virtualenv)

# Activate zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh

if [ "$ZSH_THEME" = 'spaceship' ]; then
  source $ZSH_CUSTOM/themes/spaceship.zsh-theme
fi
