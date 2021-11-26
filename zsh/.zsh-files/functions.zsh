#!/usr/bin/env zsh

fzf_down() {
  fzf --height 50% "$@" --border
}

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

is_dotfiles() {
  [[ $(basename `git rev-parse --show-toplevel`) =~ "dotfiles" ]] > /dev/null 2>&1
}

ga() {
  is_in_git_repo || return

  if [[ $# -eq 0 ]] ; then
    echo "git add ."
    git add .
  else
    echo "git add $@"
    git add "$@"
  fi
}

gb() {
  is_in_git_repo || return

  if [[ $# -eq 0 ]] ; then
    git branch -a --color=always | grep -v '/HEAD\s' | sort |
      fzf_down --ansi --multi --tac | sed 's/^..//' | cut -d' ' -f1 |
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

gush() {
  is_in_git_repo || return
  git push
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

my_vim() {
  if [[ "$#" == "0" ]]; then
    vim -c "call util#last_buffer(0)"
  else
    vim "$@"
  fi
}

gdl() {
  if [[ "$#" == "0" ]]; then
    git diff @~
  else
    git diff "@~$@"
  fi
}
