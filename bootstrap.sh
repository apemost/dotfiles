git pull origin master

if [ "$(uname -s)" = 'Darwin' ]; then
  rsync \
    --exclude '.git/' \
    --exclude '.DS_Store' \
    --exclude 'apt.sh' \
    --exclude 'bootstrap.sh' \
    --exclude 'README.md' \
    --exclude 'LICENSE' \
    -avh --no-perms . ~
else
  rsync \
    --exclude '.git/' \
    --exclude '.DS_Store' \
    --exclude '.mac' \
    --exclude '.macos' \
    --exclude 'brew.sh' \
    --exclude 'bootstrap.sh' \
    --exclude 'README.md' \
    --exclude 'LICENSE' \
    -avh --no-perms . ~
fi

if [[ "$SHELL" =~ 'zsh$' ]]; then
  source ~/.zshrc
else
  source ~/.bashrc
fi
