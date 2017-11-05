cl() { history -p '!!'|tr -d \\n|pbcopy; }
rgv() { vim $(rg -l "$@"); }
tssh() { tmate display -p '#{tmate_ssh}' | pbcopy; }
vv() {
  local files
  files=$(grep '^>' ~/.viminfo | cut -c3- |
    while read line; do
      [ -f "${line/\~/$HOME}" ] && echo "$line"
    done | fzf-tmux -d -m -q "$*" -1) && vim ${files//\~/$HOME}
}
