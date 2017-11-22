cl() { history -p '!!'|tr -d \\n|pbcopy; }
rgv() { vim $(rg -l "$@"); }
tssh() { tmate display -p '#{tmate_ssh}' | pbcopy; }
vv() {
  local file
  file=$(fzf-tmux --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

fzf_down() {
  fzf --height 50% "$@" --border
}
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}
gb() {
  is_in_git_repo || return
  if [[ $# -eq 0 ]] ; then
    git branch -a --color=always | grep -v '/HEAD\s' | sort |
      fzf_down --ansi --multi --tac --preview-window right:70% \
      --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -200' |
      sed 's/^..//' | cut -d' ' -f1 |
      sed 's#^remotes/##' | xargs git checkout
  else
    git branch $@
  fi
}
