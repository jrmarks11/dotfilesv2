cl() { history -p '!!'|tr -d \\n|pbcopy; }
rgv() { vim $(rg -l "$@"); }
tssh() { tmate display -p '#{tmate_ssh}' | pbcopy; }
vv() {
  local file
  file=$(fzf-tmux --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}
