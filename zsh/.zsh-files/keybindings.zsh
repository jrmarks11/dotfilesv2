#!/usr/bin/env zsh

export KEYTIMEOUT=1

bindkey -v
bindkey "^[f" forward-word
bindkey "^[b" backward-word
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^k" kill-line
bindkey '^y' yank

bindkey "^n" history-substring-search-down
bindkey "^p" history-substring-search-up
bindkey -r "^Q"
bindkey -r "^S"

backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
