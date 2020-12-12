#!/bin/bash
err() {
  >&2 echo "ERROR:: $1"
}
warn() {
  echo "WARN:: $1"
}
log() {
  echo "> $1"
}

link() {
  local from=$PWD/$1
  local to=$2

  # issues with from/to
  [ ! -f "$1" ] && err "File '$1' does not exist" && exit
  [ -f "$2" ] && err "'$2' already exist and is file ... aborting" && exit

  # link already present
  [ -L "$2" ] && warn "link for '$2' already exist ... skpping" && return

  # perform linking
  log "linking '$1' to '$2'"
  ln -s $from $to
}

# zshrc
link "zshrc" "${HOME}/.zshrc"
link "gitconfig" "${HOME}/.gitconfig"
