[ -n "$PS1" ] && source ~/.shellrc

if [ ! -d $ZSH ]; then
  git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH
fi

# `_` and `-` will be interchangeable
HYPHEN_INSENSITIVE='true'

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS='yyyy-mm-dd'

# Disable oh-my-zsh auto update
DISABLE_AUTO_UPDATE='true'

# The value of this parameter is expanded and used as the primary prompt string.
PS1="%{$fg[green]%}%B%n@%m%b%{$reset_color%}:%{$fg[blue]%}%B%~%b%{$reset_color%}
%{$fg[green]%}%B➜%b%{$reset_color%} "

# The value of this parameter is expanded as with PS1 and used as the secondary prompt string.
PS2="%{$fg[yellow]%}%B➜%b%{$reset_color%} "

# Load plugins
plugins=(colored-man-pages)
awesome_plugins=(autojump docker git kubectl pip tmux)
for plugin in ${awesome_plugins[@]}; do
  if command -v $plugin > /dev/null; then
    plugins+=($plugin)
  fi
done
unset plugin awesome_plugins

# Activate zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
