# loads enviroments -> overwrites, appends or prepends paths
source ${HOME}/.zshenv

# homebrew specific -> using Rosetta specific installations
export PATH="/usr/local/bin:/usr/local/sbin:${PATH}"

# custom zsh settings
if [ -f "${HOME}/.dotfiles/zsh/completion.zsh" ]; then
  source "${HOME}/.dotfiles/zsh/completion.zsh"
fi
