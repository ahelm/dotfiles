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

# user-installed
export PATH="$HOME/.local/bin:$PATH"

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

# makes sure a cache dir exists
[[ ! -d $ZSH_CACHE_DIR ]] && mkdir -p $ZSH_CACHE_DIR

# custom zsh settings
# autoload -Uz compinit && compinit
if [ -d $ZSH ]; then
  source $ZSH/general.zsh
  source $ZSH/completion.zsh
  source $ZSH/theme.zsh
  source $ZSH/functions.zsh
  source $ZSH/alias.zsh
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  echo "'$ZSH' does not exist!"
fi
autoload -Uz compinit && compinit

# setting up FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

