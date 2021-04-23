source ~/.zsh_alias

PROMPT='%n@%m %~
> '

export PATH=$HOME/.cargo/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
