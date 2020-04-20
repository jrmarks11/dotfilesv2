#!/usr/bin/env zsh

alias ..='cd ..'
alias cat='bat'
alias gco='git checkout'
alias gd='git diff'
alias gdm='git diff master'
alias gh='git hs'
alias gl='git log'
alias gs='git status -s'
alias gull='git pull'
alias j='fasd_cd -d'
alias jj='fasd_cd -d -i'
alias l.='fd -Hd 1 "^\." | xargs exa -lad'
alias l='exa -l'
alias la='exa -la'
alias less='bat'
alias ll='fd -Hd 1 -t l | xargs exa -la'
alias ls='exa'
alias lt='exa -laT'
alias s.='source ~/.zshrc'
alias up='brew upgrade -s; brew cleanup; antibody update; vim -c "PlugUpdate|qa";'
alias v='my_vim'
alias vi='my_vim'
alias vim='my_vim'

if [[ "$TMUX" =~ "/tmate-" ]]; then
  alias tmux="TMUX='' tmux"
fi
