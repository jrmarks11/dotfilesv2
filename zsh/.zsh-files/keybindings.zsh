export KEYTIMEOUT=1

bindkey -v
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^k" kill-line
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward
bindkey "^u" backward-kill-line
bindkey "^_" undo

backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

backward-word-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-word
}
zle -N backward-word-dir
bindkey "^[f" forward-word-dir

forward-word-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle forward-word
}
zle -N forward-word-dir
bindkey "^[b" backward-word-dir

# Open current command in Vim
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^v" edit-command-line

# Copy the most recent command to the clipboard
function _pbcopy_last_command(){
  history | tail -1 | sed 's/ *[0-9]* *//' | pbcopy && \
    tmux display-message "Previous command coppied to clipboard"
}
zle -N pbcopy-last-command _pbcopy_last_command
bindkey '^y' pbcopy-last-command

# Keybind to fuzzy find a git branch inline
gb_inline() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
    fzf_down --ansi --multi --tac | sed 's/^..//' | cut -d' ' -f1 |
    sed 's#^remotes/origin/##' | pbcopy
  RBUFFER="$(pbpaste)${RBUFFER}"
  zle autosuggest-clear
  zle end-of-line
  zle reset-prompt
}
zle -N _gb gb_inline
bindkey '^g' _gb
