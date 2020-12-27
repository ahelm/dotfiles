#!/bin/bash
err() {
  echo >&2 "ERROR:: $1"
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
  [ ! -f "$from" ] && err "File '$from' does not exist ... aborting" && exit
  [ -f "$to" ] && [ ! -L "$to" ] && err "'$to' already exist and is file ... aborting" && exit

  # link already present
  [ -L "$to" ] && warn "link for '$to' already exist ... skpping" && return

  # perform linking
  log "linking '$1' to '$to'"
  ln -s $from $to
}

# Linking of diffenrent files
ln -sf $PWD ${HOME}/.dotfiles
link "zshrc" "${HOME}/.zshrc"
link "gitconfig" "${HOME}/.gitconfig"
link "gitignore" "${HOME}/.gitignore"
link "zshenv" "${HOME}/.zshenv"
link "vimrc" "${HOME}/.vimrc"
