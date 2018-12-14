packages=(
  zsh
  curl
  ack
  findutils
  heroku/brew/heroku
  httpie
  git
  jq
  libsodium
  node
  rbenv
  rbenv-bundle-exec
  rbenv-bundler-ruby-version
  rbenv-default-gems
  ruby-build
  tldr
  trash
  wget
)

echo "installing packages..."
brew install ${packages[@]}
