if [ ! -n "$ZSH" ]; then
  ZSH=$HOME/.oh-my-zsh
fi

if [ ! -d $ZSH ] ; then
  echo "Installing oh-my-zsh..."
  ruby -e "$(git clone https://github.com/robbyrussell/oh-my-zsh.git $ZSH)"
fi
