#!/usr/bin/env zsh

DOTDIRS="$HOME/.files"
cd $HOME

link_dotfile () {
  if (( $# != 2 )); then echo "link called with wrong number of aruments ($# not 2)"; fi

  echo "ln -s $DOTDIRS/$1/$2 .$2"
  # $(ln -s "$DOTDIRS/zsh/$filename .$filename")
}

set -A zsh      zshrc zshenv
set -A tcsh     tcshrc login
set -A irb      irbrc
set -A dotfiles zsh tcsh irb

for dir in $dotfiles; do
  for file in ${(P)dir}; do
    link_dotfile $dir $file
  done
done
