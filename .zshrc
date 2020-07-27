function warning () echo -e "\e[1;33m WARNING::$1\e[0m"

# OH-MY-ZSH installation
if [ -d "${HOME}/.oh-my-zsh" ]; then
  HYPHEN_INSENSITIVE="true"
  DISABLE_AUTO_UPDATE="true"
  DISABLE_UPDATE_PROMPT="true"
  plugins=(common-aliases osx git)
  export ZSH=$HOME/.oh-my-zsh
  source $ZSH/oh-my-zsh.sh
else
  warning "No valid 'oh-my-zsh' directory found"
fi

# Missing paths in default setup:
# - includes brew
# - includes pyenv
# - and everything installed with brew
export PATH="/usr/local/sbin:${PATH}"
export PATH="/usr/local/bin:${PATH}"
export PATH="/opt/X11/bin:${PATH}"
export PATH="/Library/TeX/texbin:${PATH}"
export MANPATH="/usr/local/man:${MANPATH}"

# fixes issues with promt on iTerm otherwise tab-compilation breaks the width
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"


# Homebrews configurations
# completion for zsh
if type brew &>/dev/null; then
  fpath+=$(brew --prefix)/share/zsh/site-functions
fi
# Number of parallel make tasks for homebrew
export HOMEBREW_MAKE_JOBS=2

# IDL path for visxd
# - appends path from VISXD_HOME to the IDL path
# - makes sure that IDL will find the whole visxd suite
# - makes sure it is a valid path
VISXD_HOME="${HOME}/Documents/Projects/visxd"
if [ -d "$VISXD_HOME" ]; then
  export IDL_PATH="<IDL_DEFAULT>:+${VISXD_HOME}"
else
  warning "No valid visxd path found"
fi

# Default editor for the terminal
if [ "$(command -v nvim)" ]; then
  export EDITOR="nvim"
  alias vim=nvim
else
  warning "No valid NeoVim command found"
fi

# Loads installed intel compiler suite
if [ -f "/opt/intel/compilers_and_libraries/mac/bin/compilervars.sh" ]; then
  source /opt/intel/compilers_and_libraries/mac/bin/compilervars.sh intel64 -platform mac
else
  warning "No valid intel compiler script found"
fi

# iTerm2 shell integration
if [ -f "${HOME}/.iterm2_shell_integration.zsh" ]; then
  source ~/.iterm2_shell_integration.zsh
else
  warning "No valid 'iterm2_shell_integration' found"
fi

# use fzf functionality for history
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
  # remove binding required for vim+iTerm to copy
  bindkey -r "^[c"
else
  echo ".fzf.zsh not found! Check if fzf is installed!"
fi

# Dracula theme
if [ -d "${HOME}/.zsh/dracula-theme" ]; then
  source ${HOME}/.zsh/dracula-theme/dracula.zsh-theme
else
  warning "No valid 'dracula-theme' directory found"
fi

# Syntax highlighting
if [ -d "${HOME}/.zsh/fast-syntax-highlighting" ]; then
  source ${HOME}/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
else
  warning "No valid 'fast-syntax-highlighting' directory found"
fi

# - use hub as git interface (easier way to work with Github)
if [ "$(command -v hub)" ]; then
  alias git=hub
fi

# - make tree be aware of color and also ignore files
alias tree="tree -C -I '*pycache*'"

# Load pyenv automatically by appending
# the following to ~/.zshrc:
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_ROOT="/Users/anton/.pyenv"

export GPG_TTY=$(tty)
export HYPOTHESIS_PROFILE=dev

alias trash="rmtrash"
alias del="rmtrash"

alias config='/usr/bin/git --git-dir=/Users/anton/.cfg/ --work-tree=/Users/anton'

# use exa as ls
alias ls="exa"
alias la="ls -lFha"

# Rust installation
export PATH="$HOME/.cargo/bin:$PATH"

# Add custom completion to fpath and finally build completions
if [ -d "${HOME}/.zsh/completions" ]; then
  fpath+=~/.zsh/completions
else
  warning "No valid custom directory found for zsh-completion"
fi
autoload -Uz compinit && compinit

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

