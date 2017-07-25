git pull origin master

rsync_linux() {
  rsync --exclude ".git/" \
    --exclude ".DS_Store" \
    --exclude ".mac" \
    --exclude ".macos" \
    --exclude "brew.sh" \
    --exclude "bootstrap.sh" \
    --exclude "README.md" \
    --exclude "LICENSE" \
    -avh --no-perms . ~
}

rsync_darwin() {
  rsync --exclude ".git/" \
    --exclude ".DS_Store" \
    --exclude "apt.sh" \
    --exclude "bootstrap.sh" \
    --exclude "README.md" \
    --exclude "LICENSE" \
    -avh --no-perms . ~
}

platform="$(uname -s)"

if [ "$platform" = "Linux" ]; then
  rsync_linux
elif [ "$platform" = "Darwin" ]; then
  rsync_darwin
else
  echo "My dotfiles are not supported yet on this platform ($platform)."
  exit 1
fi

unset rsync_linux
unset rsync_darwin
unset platform
exec "$SHELL" -l
