[ -n "$PS1" ] && source ~/.shellrc

if [ ! -d $ZSH ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# `_` and `-` will be interchangeable
HYPHEN_INSENSITIVE="true"

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Disable oh-my-zsh auto update
DISABLE_AUTO_UPDATE="true"

# Load plugins
plugins=(autojump git tmux colored-man-pages)

# Activate zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh

if [ ! -d $ZPLUG_HOME ]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_EXEC_TIME_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_PACKAGE_SHOW=false

ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

source ~/.zplug/init.zsh
zplug 'denysdovhan/spaceship-zsh-theme', use:spaceship.zsh, from:github, as:theme
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug check || zplug install
zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
