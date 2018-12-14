#!/usr/bin/env zsh

cd $HOME
DOTDIRS=.files

link_dotfile () {
  if (( $# != 2 )); then echo "link called with wrong number of aruments ($# not 2)"; fi

	dir=$1
	filename=$(echo $2 | cut -f1 -d\=)
  aliasname=$(echo $2 | cut -f2 -d\=)

  if [ "$aliasname" = "" ]; then
    aliasname=$filename
  fi

  if [ ! -L ".$aliasname" ]; then
	  echo "ln -s $DOTDIRS/$dir/$filename .$aliasname"
	  ruby -e "$(ln -s $DOTDIRS/$dir/$filename .$aliasname)"
  fi
}

set -A zsh      zshenv
set -A tcsh     tcshrc login
set -A irb      irbrc
set -A git      config=gitconfig
set -A dotfiles zsh tcsh irb git

for dir in $dotfiles; do
  for file in ${(P)dir}; do
    link_dotfile $dir $file
  done
done

