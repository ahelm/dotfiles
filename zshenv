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
export PATH="$PYENV_ROOT/bin:$PATH"

# Homebrew M1 installation
export PATH="/opt/homebrew/bin:$PATH"

# Other tools install in /usr/local/bin
export PATH="/usr/local/bin:$PATH"

# user-installed
export PATH="$HOME/.local/bin:$PATH"

# llvm export
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# sets LANG enviroment variables -> avoids ssh issues
export LANG=en_US.UTF-8
export LANGUAGE=en_US.utf8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_PAPER=en_US.UTF-8
export LC_IDENTIFICATION=en_US.UTF-8
export LC_NAME=en_US.UTF-8
export LC_ADDRESS=en_US.UTF-8
export LC_TELEPHONE=en_US.UTF-8
export LC_MEASUREMENT=en_US.UTF-8
export LC_ALL=en_US.UTF-8
