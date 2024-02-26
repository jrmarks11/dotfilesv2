" Super useful you can type a partial command and type <c-p> to go to the last
" command that started with that
cnoremap <c-n> <down>
cnoremap <c-p> <up>

" Just a couple readline things i prefer to use c-f if i need a lot of editing
cnoremap <c-a> <home>
cnoremap <esc>b <s-left>
cnoremap <esc>f <s-right>
cnoremap <esc><bs> <c-w>
cnoremap <c-k> <c-\>estrpart(getcmdline(),0,getcmdpos()-1)<cr>

cnoremap <expr> .. getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '..'
