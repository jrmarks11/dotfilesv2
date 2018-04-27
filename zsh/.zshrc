source /usr/local/opt/zplug/init.zsh

zplug 'mafredri/zsh-async', from:github
zplug 'dfurnes/purer', use:pure.zsh, from:github, as:theme
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions', defer:2
zplug 'zsh-users/zsh-history-substring-search'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug load

export EDITOR=vim
export VISUAL=vim

bindkey -v
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^k" kill-line
bindkey "^d" delete-char
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward
bindkey "^y" accept-and-hold
bindkey "^w" backward-kill-word
bindkey "^u" backward-kill-line
bindkey "^[f" forward-word
bindkey "^[b" backward-word

# Open current command in Vim
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^x^e" edit-command-line

# Copy the most recent command to the clipboard
function _pbcopy_last_command(){
  history | tail -1 | sed 's/ *[0-9]* *//' | pbcopy && \
    tmux display-message "Previous command coppied to clipboard"
}
zle -N pbcopy-last-command _pbcopy_last_command
bindkey '^x^y' pbcopy-last-command

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history
setopt append_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups

alias ..='cd ..'
alias bake='bundle exec rake'
alias be='bundle exec'
alias bec='bundle exec rails c'
alias ber='bundle exec rspec'
alias chores='cp ~/Dropbox\ \(Personal\)/Documents/tasks/defaults/chores.taskpaper ~/Dropbox\ \(Personal\)/Documents/tasks/chores$(date +"%m%d%y").taskpaper'
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
alias mt='mix test --trace'
alias mtd='iex -S mix test --trace'
alias s.='source ~/.zshrc'
alias v='f -e vim'
alias vi='vim'

tssh() { tmate display -p '#{tmate_ssh}' | pbcopy; }

fzf_down() {
  fzf --height 50% "$@" --border
}
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}
ga() {
  is_in_git_repo || return
  if [[ $# -eq 0 ]] ; then
    git add .
  else
    git add "$@"
  fi
}
gb() {
  is_in_git_repo || return
  if [[ $# -eq 0 ]] ; then
    git branch -a --color=always | grep -v '/HEAD\s' | sort |
      fzf_down --ansi --multi --tac --preview-window right:70% \
      --preview "git log --oneline --graph --date=short --pretty='format:%C(auto)%cd %h%d %s' $(sed s/^..// <<< {} | cut -d' ' -f1) | head -200" |
      sed 's/^..//' | cut -d' ' -f1 |
      sed 's#^remotes/origin/##' | xargs git checkout
  else
    git branch "$@"
  fi
}
gc() {
  is_in_git_repo || return
  if [[ $# -eq 0 ]] ; then
    git commit --verbose
  else
    git commit -m "$1"
  fi
}

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ "$1" ]; then
     tmux $change -t "$1" 2>/dev/null ||
       (tmux new-session -d -s "$1" && tmux $change -t "$1"); return
  fi
  if (( $(tmux list-sessions | wc -l) == 1 )); then
    session=$(tmux list-sessions -F "#{session_name}")
  else
    session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0)
  fi
  tmux $change -t "$session" || tm "$(whoami)"
}

if [[ $(command -v fasd) ]]; then
  fasd_cache="$HOME/.fasd-init-zsh"
  if [ "$(command -v fasd)" -nt "$fasd_cache" ] || [ ! -s "$fasd_cache" ]; then
    fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install >| "$fasd_cache"
  fi
  . "$fasd_cache"
  unset fasd_cache
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

command -v hub >/dev/null 2>&1 && { eval "$(hub alias -s)"; }

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--reverse'

if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

if [ -d "/usr/local/bin" ] ; then
  PATH="/usr/local/bin:$PATH"
fi

export PATH="/usr/local/sbin:$PATH"

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval "$(ssh-agent -s)"
  ssh-add
fi

[ -f /usr/local/opt/asdf/asdf.sh ] && . /usr/local/opt/asdf/asdf.sh
[ -f /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash ] &&
  . /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
