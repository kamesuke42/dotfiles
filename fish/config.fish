if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx PATH "$HOME/.cargo/bin" $PATH;
    set -gx DENO_INSTALL $HOME/.deno
    set -gx PATH $PATH $DENO_INSTALL/bin
    set -gx VOLTA_HOME $HOME/.volta
    set -gx PATH $PATH $VOLTA_HOME/bin

    function fish_prompt -d "Write out the prompt"
        printf '%s%s%s 🐢 ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
    end

    set -x PATH $HOME/.rbenv/bin $PATH
    status --is-interactive; and source (rbenv init -|psub)
end
