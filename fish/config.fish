if status is-interactive
    # Commands to run in interactive sessions can go here
    source $HOME/.cargo/env
    set -gx DENO_INSTALL $HOME/.deno
    set -gx PATH $PATH $DENO_INSTALL/bin
end
