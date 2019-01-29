#!/usr/bin/env zsh

export KEYTIMEOUT=1

bindkey -v
bindkey "^[b" backward-word
bindkey "^[f" forward-word
bindkey "^_" undo
bindkey "^a" beginning-of-line
bindkey "^b" backward-char
bindkey "^d" delete-char
bindkey "^e" end-of-line
bindkey "^f" forward-char
bindkey "^k" kill-line
bindkey "^n" history-substring-search-down
bindkey "^p" history-substring-search-up
bindkey "^u" backward-kill-line
bindkey "^w" backward-kill-word

backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

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
    fzf_down --ansi --tac | sed 's/^..//' | cut -d' ' -f1 |
    sed 's#^remotes/origin/##' | pbcopy
  RBUFFER="$(pbpaste)${RBUFFER}"
  zle autosuggest-clear
  zle end-of-line
  zle reset-prompt
}
zle -N _gb gb_inline
bindkey '^g' _gb

dk_inline() {
  docker ps --format '{{.Names}}' | fzf_down --ansi --tac | pbcopy
  RBUFFER="$(pbpaste)${RBUFFER}"
  zle autosuggest-clear
  zle end-of-line
  zle reset-prompt
}

zle -N _dk dk_inline
bindkey '^s' _dk
