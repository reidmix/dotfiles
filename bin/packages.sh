packages=(
  zsh
  curl
  ack
  findutils
  heroku
  httpie
  git
  jq
  rbenv
  rbenv-bundle-exec
  rbenv-bundler-ruby-version
  rbenv-default-gems
  ruby-build
  trash
  wget
  homebrew/dupes/grep
)

echo "installing packages..."
brew install ${packages[@]}
