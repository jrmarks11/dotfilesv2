" Navigate vim and tmux the same way (yay)
nnoremap <silent><c-j>h :TmuxNavigateLeft<cr>
nnoremap <silent><c-j>j :TmuxNavigateDown<cr>
nnoremap <silent><c-j>k :TmuxNavigateUp<cr>
nnoremap <silent><c-j>l :TmuxNavigateRight<cr>

inoremap <silent><c-j>h <esc>:TmuxNavigateLeft<cr>
inoremap <silent><c-j>j <esc>:TmuxNavigateDown<cr>
inoremap <silent><c-j>k <esc>:TmuxNavigateUp<cr>
inoremap <silent><c-j>l <esc>:TmuxNavigateRight<cr>

xnoremap <silent><c-j>h <esc>:TmuxNavigateLeft<cr>
xnoremap <silent><c-j>j <esc>:TmuxNavigateDown<cr>
xnoremap <silent><c-j>k <esc>:TmuxNavigateUp<cr>
xnoremap <silent><c-j>l <esc>:TmuxNavigateRight<cr>
