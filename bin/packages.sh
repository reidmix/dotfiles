packages=(
  zsh
  curl
  ack
  git
  hub
  rbenv
  ruby-build
  trash
  wget
  homebrew/dupes/grep
)

echo "installing packages..."
brew install ${packages[@]}
