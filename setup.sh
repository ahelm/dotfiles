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
ensure_installed_brew() {
  log "checking installation for '$1'"
  brew list $1 &>/dev/null || brew install $1
}

ensure_installed_cargo() {
  log "checking installation for '$1'"
  cargo install $1
}

ensure_installed_apt() {
  log "checking installation for '$1'"
  sudo apt install $1
}

link() {
  local from=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/$1
  local to=$2

  # issues with from/to
  if [ ! -f "$from" ] && [ ! -d "$from" ]; then
    err "File/directory '$from' does not exist ... aborting"
    exit
  fi
  [ -f "$to" ] && [ ! -L "$to" ] && err "'$to' already exist and is file ... aborting" && exit

  # link already present
  [ -L "$to" ] && warn "link for '$to' already exist ... skpping" && return

  # ensure parent directory exists
  [ ! -d "$(dirname $to)" ] && warn "Missing parent directory ... creating " && mkdir -p "$(dirname $to)"

  # perform linking
  log "linking '$1' to '$to'"
  ln -v -s $from $to
}

# Linking of diffenrent files
if [ -L "${HOME}/.dotfiles" ]; then
  warn "'${HOME}/.dotfiles' already exist, relinking"
  rm "${HOME}/.dotfiles"
  ln -s $PWD ${HOME}/.dotfiles
else
  ln -s $PWD ${HOME}/.dotfiles
fi
link zshrc	${HOME}/.zshrc
link gitconfig	${HOME}/.gitconfig
link gitignore	${HOME}/.gitignore
link vimrc	${HOME}/.vimrc
# link nvim	${HOME}/.config/nvim

# handy packages
# installed by brew, apt, snap or other package managers
if [ "$(uname)" == "Darwin" ]; then
  ensure_installed_brew bat
  ensure_installed_brew exa
  ensure_installed_brew dust
  ensure_installed_brew fd
  ensure_installed_brew ripgrep
  ensure_installed_brew git

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # UBUNTU
  if [ -n "$(uname -a | grep Ubuntu)" ]; then
    # make sure rust is installed
    if ! command -v cargo &> /dev/null; then
      sudo apt update && sudo apt upgrade && sudo apt install -y curl gcc
      warn "Missing a valid rust installation"
      curl https://sh.rustup.rs -sSf | sh
      source $HOME/.cargo/env
    fi
    
    ensure_installed_cargo bat
    ensure_installed_cargo exa
    ensure_installed_cargo du-dust
    ensure_installed_cargo ripgrep

    # Requires 'make' to be installed for 'fd-find'
    ensure_installed_apt make
    cargo install fd-find

    # zsh highlighting
    ensure_installed_apt zsh-syntax-highlighting

    ensure_installed_apt git
  else
    echo "Invalid system for tool installations"
  fi
fi

# fzf installation
if [ ! -d $HOME/.fzf ]; then
  git clone https://github.com/junegunn/fzf.git $HOME/.fzf
fi

if ! command -v fzf &> /dev/null; then
  $HOME/.fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish
fi

