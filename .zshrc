# If you see this and ur on a fresh install, you remembered to copy ur zshrc

export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

autoload -Uz compinit && compinit

autoload -Uz colors && colors
PROMPT="%F{039}╭─%f %F{105}%n%F{147}@%F{075}%m%f in %F{069}[%f%~%F{069}]%f
%F{039}╰─%F{147}%% %f"

# Kitty Title
precmd() { print -Pn "\e]2;Kitty at: %~\a"; }
preexec() { print -Pn "\e]2;$1\a"; }

eval "$(zoxide init zsh)"
alias cd="z"
alias ccd="builtin cd"

alias cls="clear"

alias ff="fastfetch"

alias cat="bat"
alias ccat="command cat"

/usr/local/bin/pfetch
echo
