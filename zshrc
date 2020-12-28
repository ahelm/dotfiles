# loads enviroments -> overwrites, appends or prepends paths
source ${HOME}/.zshenv

# makes sure a cache dir exists
[[ ! -d $ZSH_CACHE_DIR ]] && mkdir -p $ZSH_CACHE_DIR

# homebrew specific -> using Rosetta specific installations
export PATH="/usr/local/bin:/usr/local/sbin:${PATH}"

# custom zsh settings
autoload -Uz compinit && compinit
if [ -d $ZSH ]; then
  source $ZSH/general.zsh
  source $ZSH/completion.zsh
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  echo "'$ZSH' does not exist!"
fi
