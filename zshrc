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
  source $(brew --prefix zsh-syntax-highlighting)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  echo "'$ZSH' does not exist!"
fi
autoload -Uz compinit && compinit

# setting up FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

