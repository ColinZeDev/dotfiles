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
PROMPT="%F{208}╭─%f %F{202}%n%F{214}@%F{166}%m%f in %F{130}[%f%~%F{130}]%f
%F{208}╰─%F{214}%% %f"

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
    pkill sxhkd && sxhkd &
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

alias oml="npx oh-my-logo"
alias oh-my-logo="npx oh-my-logo"

fastfetch
echo
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fnm
FNM_PATH="/home/ctech/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --shell zsh)"
fi
