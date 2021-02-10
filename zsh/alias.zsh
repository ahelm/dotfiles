# working with python's virtualenviromnets
alias venv=create_virtual_env
alias vact=activate_virtual_env

# super user alias
alias _='sudo '

# walking the directory tree
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# dealing with directories
alias md='mkdir -p'
alias rd=rmdir

# List directory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lah'

# ls colors
if command exa &>/dev/null; then
  alias ls='exa'
  alias tree="exa --tree"
fi

# enable diff color if possible.
if command diff --color . . &>/dev/null; then
  alias diff='diff --color'
fi

# use bat for cat
if type "bat" >/dev/null; then
  alias cat='bat'
fi

# Neovim as default vim editor
alias vim="nvim"
