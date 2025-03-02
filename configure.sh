#!/bin/zsh

if [! -d $HOME/.config]; then
  mkdir -p $HOME/.config/

fi

cp -r * $HOME/.config/ 
