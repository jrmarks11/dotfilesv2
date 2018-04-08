" Command bindings

" type %% to show the path of the current file minus the file name
cnoremap <expr> %% getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'
" type .. to show the the current file name
cnoremap <expr> .. getcmdtype() == ':' ? fnameescape(expand('%')) : '..'

" super useful you can type a partial command and type <c-p> to go to the last
" command that started with that
cnoremap <c-n> <down>
cnoremap <c-p> <up>

" just a couple readline things i prefer to use c-f if i need a lot of editing
cnoremap <c-a> <home>
cnoremap <esc>b <s-left>
cnoremap <esc>f <s-right>
