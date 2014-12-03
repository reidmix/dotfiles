packages=(
  zsh
  curl
  ack
  findutils
  git
  hub
  rbenv
  ruby-build
  squashfs
  trash
  wget
  homebrew/dupes/grep
)

echo "installing packages..."
brew install ${packages[@]}
