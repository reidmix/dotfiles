if [ ! -n "$ZSH" ]; then
  OMYZSH=$HOME/.oh-my-zsh
fi

if [ ! -d $OMYZSH ] ; then
  echo "Installing oh-my-zsh..."
  ruby -e "$(git clone https://github.com/robbyrussell/oh-my-zsh.git $OMYZSH)"
fi

ZSH="/usr/local/bin/zsh"
ALLOWED="/etc/shells"

# add zsh to allowed shell
if [ ! $(grep $ZSH $ALLOWED) ]; then
	echo "Adding $ZSH to $ALLOWED"
	echo $ZSH | sudo tee -a $ALLOWED > /dev/null
fi

if [ $SHELL != $ZSH ]; then
	chsh -s $ZSH
fi
