# Use local compiled binaries
[[ -d "${HOME}/.local/bin" ]] && export PATH="${HOME}/.local/bin:$PATH"
[[ -f "${HOME}/.cargo/env" ]] && source "$HOME/.cargo/env"
