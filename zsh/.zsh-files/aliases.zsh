#!/usr/bin/env zsh

alias ..='cd ..'
alias cat='bat'
alias d='docker'
alias dc='docker compose'
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}"'
alias dsp='docker system prune'
alias gco='git checkout'
alias gd='git diff'
alias gdm='git diff master'
alias ghs='git hs'
alias gs='git status -s'
alias gull='git pull'
alias j='z'
alias l.='fd -Hd 1 "^\." | xargs eza -lad'
alias l2='eza -laT -L 2'
alias l3='eza -laT -L 3'
alias l='eza -l'
alias la='eza -la'
alias ll='fd -Hd 1 -t l | xargs eza -lad'
alias ls='eza'
alias lt='eza -laT'
alias s.='source ~/.zshrc'
alias sc='sesh connect $(sesh list | fzf)'
alias up='brew upgrade; brew cleanup -s; zinit update; nvim --headless "+Lazy! update" +qa'
alias vim='nvim'
