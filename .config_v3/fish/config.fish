set -g fish_greeting ""

starship init fish | source

# fzf_configure_bindings
zoxide init fish | source

zoxide init --cmd cd fish | source

alias vi="nvim"
alias vim="nvim"
alias ls="eza"
alias ll="eza -lh"
alias la="eza -lah"
alias yy="yazi"
alias ff="fzf --preview='bat --color=always {}'"
alias ffc="fzf --preview='cat {}'"
alias zz="zellij"
alias hx="helix"
alias ldc="lazydocker"


# docker aliases
alias dcf="docker compose up -d --force-recreate"
alias dcr="docker compose restart"
alias dcs="docker compose stop"
alias dcd="docker compose down"
alias dcp="docker compose ps"
alias dcl="docker compose logs -f --tail=100"


set -x LD_LIBRARY_PATH /home/ishan/.local/lib/arch-mojo $LD_LIBRARY_PATH
set -x PATH $PATH /home/ishan/.modular/bin
set -x PATH $PATH /home/ishan/.lmstudio/bin

set -x GIT_SSH_KEY (awk '{printf "%s\\n",$0}' ~/.ssh/id_ed25519)
set -x DOCKER_BUILDKIT 1
set -x GIT_SSH_KEY_PATH /home/ishan/.ssh/id_ed25519_no_passphrase
set -U fish_user_paths /home/ishan/.local/bin

if set -q ZELLIJ
    function __zellij_preexec --on-event fish_preexec
        set cmd (string split ' ' $argv[1])[1]
        if test "$cmd" != "cd" -a "$cmd" != ""
            zellij action rename-tab "$cmd" >/dev/null 2>&1
        end
    end

    function __zellij_precmd --on-event fish_prompt
        if test "$PWD" = "$HOME"
            set title "~"
        else
            set title (basename $PWD)
        end
        zellij action rename-tab "$title" >/dev/null 2>&1
    end
end
fish_add_path $HOME/.cargo/bin


# Added by Antigravity CLI installer
set -gx PATH "/home/ishan/.local/bin" $PATH
