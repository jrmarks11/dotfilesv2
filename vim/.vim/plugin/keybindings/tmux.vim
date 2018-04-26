" Navigation works the same outside tmux
nnoremap <c-j> <c-w>

" Quit tmux panes and vim panes the same way
nnoremap <c-j>x <c-w>q

" Navigate vim and tmux the same way (yay)
nnoremap <silent><c-j>h :TmuxNavigateLeft<cr>
nnoremap <silent><c-j>j :TmuxNavigateDown<cr>
nnoremap <silent><c-j>k :TmuxNavigateUp<cr>
nnoremap <silent><c-j>l :TmuxNavigateRight<cr>
nnoremap <silent><c-j>b :TmuxNavigatePrevious<cr>
