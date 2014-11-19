#!/usr/bin/env zsh

cd $HOME
DOTDIRS=.files

link_dotfile () {
  if (( $# != 2 )); then echo "link called with wrong number of aruments ($# not 2)"; fi

	dir=$1
	filename=$2

  if [ ! -L ".$filename" ]; then
	  echo "ln -s $DOTDIRS/$dir/$filename .$filename"
	  ruby -e "$(ln -s $DOTDIRS/$dir/$filename .$filename)"
  fi
}

set -A zsh      zshenv
set -A tcsh     tcshrc login
set -A irb      irbrc
set -A dotfiles zsh tcsh irb

for dir in $dotfiles; do
  for file in ${(P)dir}; do
    link_dotfile $dir $file
  done
done
