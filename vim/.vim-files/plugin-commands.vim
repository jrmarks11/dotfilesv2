let s:fzf_options =
  \ '--reverse ' .
  \ '--preview "(mdiff {} | tail -n +5 || cat {}) 2> /dev/null | head -'.&lines.'"'
command! -bang BranchFiles call fzf#run(fzf#wrap('BranchFiles',
      \ { 'source': 'branch_files', 'options': s:fzf_options }, <bang>0))
command! -bang UncommitedFiles call fzf#run(fzf#wrap('UncommitedFiles',
      \ { 'source': 'branch_files -w', 'options': s:fzf_options }, <bang>0))

let s:fzf_grep_cmd =
      \ 'rg --column --line-number --no-heading --fixed-strings --ignore-case'
      \ . " --hidden --follow --glob '!.git/*' --color 'always' "
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(s:fzf_grep_cmd .shellescape(<q-args>), 1,
      \ fzf#vim#with_preview('right:50%'), <bang>0)
