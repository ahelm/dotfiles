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

ensure_installed() {
  if ! command -v brew &> /dev/null; then
    err "Requires brew to be installed"
    exit 1
  fi
  log "checking installation for '$1'"
  brew list $1 &>/dev/null || brew install $1
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
link nvim	${HOME}/.config/nvim

# only if 'i3' is present as executable
if ! command -v i3; then
  link i3     ${HOME}/.config/i3/config
else
  warn "Skipping 'i3' installation"
fi

# handy packages
# installed by brew, apt, snap or other package managers
ensure_installed bat
ensure_installed exa
ensure_installed dust
ensure_installed fd
ensure_installed ripgrep
ensure_installed git
ensure_installed neovim

# fzf installation
if [ ! -d $HOME/.fzf ]; then
  git clone https://github.com/junegunn/fzf.git $HOME/.fzf
fi

if ! command -v fzf &> /dev/null; then
  $HOME/.fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish
fi

