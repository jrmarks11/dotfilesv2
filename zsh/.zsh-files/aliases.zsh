#!/usr/bin/env zsh

alias ..='cd ..'
alias bake='bundle exec rake'
alias be='bundle exec'
alias bec='bundle exec rails c'
alias ber='bundle exec rspec'
alias bes='bundle exec rails s'
alias cat='bat'
alias d='docker'
alias dc='docker-compose'
alias gco='git checkout'
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}"'
alias gd='git diff'
alias gdm='git diff main'
alias gh='git hs'
alias gl='git log'
alias gs='git status -s'
alias gull='git pull'
alias j='z'
alias ji='zi'
alias less='bat'
alias l.='fd -Hd 1 "^\." | xargs eza -lad'
alias l2='eza -laT -L 2'
alias l3='eza -laT -L 3'
alias l='eza -l'
alias la='eza -la'
alias less='bat'
alias ll='fd -Hd 1 -t l | xargs eza -lad'
alias ls='eza'
alias lt='eza -laT'
alias s.='source ~/.zshrc'
alias up='brew upgrade; brew cleanup -s; antidote update; nvim --headless "+Lazy! update" +qa'
alias vim='nvim'
