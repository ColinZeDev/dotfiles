# If you see this and ur on a fresh install, you remembered to copy ur zshrc

export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

autoload -Uz compinit && compinit -d /tmp/.${USER}_zshrc_compinitdump

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

setopt AUTO_MENU
setopt COMPLETE_IN_WORD
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt CORRECT

autoload -Uz colors && colors
PROMPT="%F{039}╭─%f %F{105}%n%F{147}@%F{075}%m%f in %F{069}[%f%~%F{069}]%f
%F{039}╰─%F{147}%% %f"

# Kitty Title
precmd() { print -Pn "\e]2;Kitty at: %~\a"; }
preexec() { print -Pn "\e]2;$1\a"; }

cleanupsystem() {

    if [[ -n "$(pacman -Qdtq)" ]]; then
        pacman -Qdtq | sudo pacman -Rns -
    else
        echo "No orphans found."
    fi

    sudo paccache -r
    sudo paccache -ruk0

    yay -Yc
}

rebspwm() {
    bspc wm -r
    pkill -USR1 sxhkd
    pkill picom && picom --daemon
}

eval "$(zoxide init zsh)"
alias cd="z"
alias ccd="builtin cd"

alias cls="clear"

alias ff="fastfetch"

alias cat="bat"
alias ccat="command cat"

alias ls="/usr/local/bin/xlist" # https://github.com/DevHollo/bash-cmds/blob/main/cmds/xlist.sh
alias lls="/sbin/ls"

fastfetch
echo
