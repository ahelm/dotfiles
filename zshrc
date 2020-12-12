# homebrew setup -> use m1 version by default
alias brew=/opt/homebrew/bin/brew
alias rosettabrew="arch -x86_64 /usr/local/bin/brew"

# local bins are used for pipx
export PATH="$PATH:/Users/anton/.local/bin"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv 1>/dev/null 2>&1 && eval "$(pyenv init -)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
