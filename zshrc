# loads enviroments -> overwrites, appends or prepends paths
source ${HOME}/.zshenv

# makes sure a cache dir exists
[[ ! -d $ZSH_CACHE_DIR ]] && mkdir -p $ZSH_CACHE_DIR

# homebrew specific -> using Rosetta specific installations
export PATH="/usr/local/opt/llvm/bin:/usr/local/bin:/usr/local/sbin:${PATH}"

# custom zsh settings
# autoload -Uz compinit && compinit
if [ -d $ZSH ]; then
  source $ZSH/general.zsh
  source $ZSH/completion.zsh
  source $ZSH/theme.zsh
  source $ZSH/functions.zsh
  source $ZSH/alias.zsh
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  echo "'$ZSH' does not exist!"
fi
autoload -Uz compinit && compinit

# setting up FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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
