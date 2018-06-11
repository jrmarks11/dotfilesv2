alias ..='cd ..'
alias bake='bundle exec rake'
alias bc='brew cleanup'
alias bd='brew doctor'
alias be='bundle exec'
alias bec='bundle exec rails c'
alias ber='bundle exec rspec'
alias bu='brew upgrade'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdl='git diff `git rev-parse @~`'
alias gdm='git diff master'
alias gh='git hs'
alias gn='git newb'
alias gr='git reset'
alias gs='git status -s'
alias gt='git top'
alias gu='git up'
alias gull='git pull'
alias gush='git push'
alias gv='git vim_last_change'
alias gvm='git vim_last_change master'
alias hem='heroku run "POOL_SIZE=2 mix ecto.migrate"'
alias hl='heroku logs'
alias ho='heroku open'
alias hush='git push heroku master'
alias j='fasd_cd -d'
alias jj='fasd_cd -d -i'
alias l.='fd -Hd 1 "^\." | xargs exa -lad'
alias l='exa -l'
alias la='exa -la'
alias ll='fd -Hd 1 -t l | xargs exa -la'
alias ls='exa'
alias lt='exa -laT'
alias mc='iex -S mix'
alias ml='mix lint'
alias ms='mix s'
alias mt='mix test --trace'
alias mtd='iex -S mix test --trace'
alias s.='source ~/.zshrc'
alias v='f -e vim'
alias vi='vim'

# Allow nesting tmux in tmate
if [[ "$TMUX" =~ "/tmate-" ]]; then
  alias tmux="TMUX='' tmux"
fi
