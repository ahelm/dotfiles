# local bins are used for pipx
export PATH="$PATH:/Users/anton/.local/bin"

# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/anton/.local/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/anton/.local/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/Users/anton/.local/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/Users/anton/.local/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup
