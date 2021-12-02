#!/usr/bin/env zsh

export KEYTIMEOUT=1

bindkey -v
bindkey "^[b" backward-word
bindkey "^[f" forward-word
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^k" kill-line
bindkey "^n" history-substring-search-down
bindkey "^p" history-substring-search-up

backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

# Copy the most recent command to the clipboard
function _pbcopy_last_command(){
  history | tail -1 | sed 's/ *[0-9]* *//' | pbcopy && \
    tmux display-message "Previous command coppied to clipboard"
}
zle -N pbcopy-last-command _pbcopy_last_command
bindkey '^y' pbcopy-last-command

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
