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

# Disable magic functions
DISABLE_MAGIC_FUNCTIONS='true'

plugins=(
  colored-man-pages
  docker
  extract
  fzf
  git
  kubectl
  nvm
  rsync
  urltools
  uv
)

additional_plugins=(
  autojump
  starship
  tmux
)

# Load plugins
for plugin in ${additional_plugins[@]}; do
  if command -v $plugin > /dev/null; then
    plugins+=($plugin)
  fi
done
unset plugin additional_plugins

# Activate zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)

zstyle ':omz:plugins:nvm' lazy yes
zstyle ':omz:plugins:nvm' autoload yes
zstyle ':omz:plugins:nvm' silent-autoload yes

source $ZSH/oh-my-zsh.sh

# Initialize colors
autoload -U colors && colors

if [ ! -d $ZPLUG_HOME ]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'zsh-users/zsh-autosuggestions'

if ! command -v starship > /dev/null; then
  SPACESHIP_BATTERY_SHOW=false
  SPACESHIP_DOCKER_COMPOSE_SHOW=false
  SPACESHIP_DOCKER_SHOW=false
  SPACESHIP_EXEC_TIME_SHOW=false
  SPACESHIP_GIT_ASYNC=false
  SPACESHIP_GRADLE_SHOW=false
  SPACESHIP_KOTLIN_SHOW=false
  SPACESHIP_PACKAGE_SHOW=false
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_VENV_SHOW=false

  zplug 'denysdovhan/spaceship-prompt', use:spaceship.zsh, from:github, as:theme
fi

zplug check || zplug install
zplug load
