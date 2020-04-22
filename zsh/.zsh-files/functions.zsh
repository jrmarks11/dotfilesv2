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

not_master() {
  if is_dotfiles; then
    return
  fi

  CURRENTBRANCH=$(git status|awk 'NR==1{print $3}')

  if [[ $CURRENTBRANCH == "master" ]]; then
      echo "You are on master you donkey!"
      1 > /dev/null 2>&1
  fi
}

ga() {
  is_in_git_repo && not_master || return

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
      fzf_down --ansi --multi --tac | sed 's/^..//' | cut -d' ' -f1 |
      sed 's#^remotes/origin/##' | xargs git checkout
  else
    git branch "$@"
  fi
}

gc() {
  is_in_git_repo && not_master || return

  if [[ $# -eq 0 ]] ; then
    git commit --verbose
  else
    git commit -m "$1"
  fi
}

gush() {
  is_in_git_repo && not_master || return
  git push
}

my_vim() {
  if [[ "$#" == "0" ]]; then
    vim -c "call util#last_buffer(0)"
  else
    vim "$@"
  fi
}
