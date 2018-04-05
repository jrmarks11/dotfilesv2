let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \   'bg':      ['bg', 'Normal'],
      \   'hl':      ['fg', 'Comment'],
      \   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \   'hl+':     ['fg', 'Statement'],
      \   'info':    ['fg', 'PreProc'],
      \   'border':  ['fg', 'Ignore'],
      \   'prompt':  ['fg', 'Conditional'],
      \   'pointer': ['fg', 'Exception'],
      \   'marker':  ['fg', 'Keyword'],
      \   'spinner': ['fg', 'Label'],
      \   'header':  ['fg', 'Comment'] }
let g:fzf_files_options =
      \ '--reverse ' .
      \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -' . &lines . '"'

let s:source = '(git diff --name-only HEAD $(git merge-base HEAD master))|sort|uniq'
let s:fzf_options =
      \ '--reverse '.
      \ '--preview "(git diff --color=always master -- {} | tail -n +5 || cat {})'
      \ . ' 2> /dev/null | head -' . &lines . '"'
command! -bang BranchFiles call fzf#run(fzf#wrap('BranchFiles',
      \ { 'source': s:source, 'options': s:fzf_options }, <bang>0))

let s:fzf_grep_cmd =
      \ 'rg --column --line-number --no-heading --fixed-strings --ignore-case'
      \ . " --hidden --follow --glob '!.git/*' --color 'always' "
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(s:fzf_grep_cmd .shellescape(<q-args>), 1,
      \ fzf#vim#with_preview('right:50%'), <bang>0)

nnoremap <space>b :Buffer!<cr>
nnoremap <space>c :GFiles?<cr>
nnoremap <space>e :History!<cr>
nnoremap <space>f :Rg!<space><c-r><c-w><cr>
xnoremap <space>f y:Rg!<space><c-r>0<cr>
nnoremap <space>i :BLines!<cr>
nnoremap <space>j :Rg!<space>
nnoremap <space>n :BranchFiles!<cr>
nnoremap <space>t :Files!<cr>
nnoremap <space>y :Helptags<cr>
