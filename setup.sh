#!/bin/bash
err() {
  > &2 echo "ERROR:: $1"
}
warn() {
  echo "> $1"
}

link() {
  local from=$PWD/$1
  local to=$2

  [ -L "$2" ] && echo "> link for '$2' already exist ... skpping" && return
  [ -f "$2" ] && echo "(* ERROR *) '$2' already exist and is file ... aborting" && exit
  ln -s $from $to
}

# zshrc
link "zshrc" "${HOME}/.zshrc"
