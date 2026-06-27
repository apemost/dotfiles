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
  extract
  nvm
  rsync
  urltools
)

additional_plugins=(
  autojump
  bun
  direnv
  docker
  fzf
  git
  kubectl
  rust
  starship
  tmux
  uv
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

if [ -r "$ZPLUG_HOME/init.zsh" ]; then
  source "$ZPLUG_HOME/init.zsh"

  zplug 'zplug/zplug', hook-build:'zplug --self-manage'
  zplug 'zsh-users/zsh-autosuggestions'

  if ! command -v starship > /dev/null; then
    SPACESHIP_PROMPT_ORDER=(
      time           # Time stamps section
      user           # Username section
      dir            # Current directory section
      host           # Hostname section
      git            # Git section (git_branch + git_status)
      node           # Node.js section
      python         # Python section
      golang         # Go section
      rust           # Rust section
      java           # Java section
      lua            # Lua section
      line_sep       # Line break
      battery        # Battery level and status
      jobs           # Background jobs indicator
      exit_code      # Exit code section
      sudo           # Sudo indicator
      char           # Prompt character
    )

    zplug 'denysdovhan/spaceship-prompt', use:spaceship.zsh, from:github, as:theme
  fi

  zplug check || zplug install
  zplug load
fi
