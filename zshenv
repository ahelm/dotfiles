# Use local compiled binaries
[[ -d "${HOME}/.local/bin" ]] && export PATH="${HOME}/.local/bin:$PATH"
[[ -f "${HOME}/.cargo/env" ]] && source "$HOME/.cargo/env"

export ZSH_CACHE_DIR="${HOME}/.zshcache"
export ZSH="${HOME}/.dotfiles/zsh"