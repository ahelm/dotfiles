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

  [ ! -f "$1" ] && err "File '$1' does not exist" && exit

  [ -L "$2" ] && warn "link for '$2' already exist ... skpping" && return
  [ -f "$2" ] && err "'$2' already exist and is file ... aborting" && exit

  ln -s $from $to
}

# zshrc
link "zshrc" "${HOME}/.zshrc"
link "gitconfig" "${HOME}/.gitconfig"
