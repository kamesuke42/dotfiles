source ~/.zsh_alias

export PATH=$HOME/.cargo/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
eval "$(pyenv init -)"
