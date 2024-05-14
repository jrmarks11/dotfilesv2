#!/usr/bin/env zsh

export KEYTIMEOUT=1

bindkey -v
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^k" kill-line

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

fzf_git_checkout() {
    local branches=$(git branch --all | grep -v HEAD | sed 's/.* //' | sed 's/remotes\///' | sort -u)
    local branch=$(echo "$branches" | fzf +m --height 40% --border)
    if [[ -n "$branch" ]]; then
        LBUFFER+="$branch"
        zle redisplay
    fi
}
zstyle ':zle:fzf_git_insert_branch' ignored-widgets 'yes'
zle -N fzf_git_checkout
bindkey -r '^G'
bindkey '^G' fzf_git_checkout
