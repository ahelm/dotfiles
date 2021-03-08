# Use local compiled binaries
[[ -d "${HOME}/.local/bin" ]] && export PATH="${HOME}/.local/bin:$PATH"
[[ -f "${HOME}/.cargo/env" ]] && source "$HOME/.cargo/env"

export ZSH_CACHE_DIR="${HOME}/.zshcache"
export ZSH="${HOME}/.dotfiles/zsh"

# `bat` configuration
export BAT_STYLE="grid"
export BAT_THEME="Dracula"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="/usr/local/opt/git:$PYENV_ROOT/bin:$PATH"
