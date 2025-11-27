#!/usr/bin/env zsh

bindkey -e

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
bindkey '^g' edit-command-line
