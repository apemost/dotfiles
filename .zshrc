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

plugins=(
  colored-man-pages
  urltools
)

awesome_plugins=(
  autojump
  docker
  git
  kubectl
  pip
  rsync
  tmux
)

# Load plugins
for plugin in ${awesome_plugins[@]}; do
  if command -v $plugin > /dev/null; then
    plugins+=($plugin)
  fi
done
unset plugin awesome_plugins

# Activate zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh

# Initialize colors
autoload -U colors && colors

# The value of this parameter is expanded and used as the primary prompt string.
PS1="%B%F{green}%n@%m%f%b:%B%F{blue}%~%f%b
%B%F{green}➜%f%b "

# The value of this parameter is expanded as with PS1 and used as the secondary prompt string.
PS2="%B%F{yellow}➜%f%b "

if [ ! -d $ZPLUG_HOME ]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_EXEC_TIME_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_VENV_SHOW=false

ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'denysdovhan/spaceship-prompt', use:spaceship.zsh, from:github, as:theme
zplug 'zsh-users/zsh-autosuggestions'
zplug check || zplug install
zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
