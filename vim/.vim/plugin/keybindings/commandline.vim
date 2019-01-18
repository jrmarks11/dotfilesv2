" Type %% to show the path of the current file minus the file name
cnoremap <expr> %% getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'
" Type .. to show the the current file name
cnoremap <expr> .. getcmdtype() == ':' ? fnameescape(expand('%')) : '..'

" Super useful you can type a partial command and type <c-p> to go to the last
" command that started with that
cnoremap <c-n> <down>
cnoremap <c-p> <up>

cnoremap WW w !sudo tee > /dev/null %
