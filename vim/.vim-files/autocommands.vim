augroup AutoResize
  autocmd!
  autocmd VimResized * wincmd =
augroup END

augroup AutoSaveAndRead
  autocmd!
  autocmd InsertLeave,TextChanged * silent! wall
  autocmd CursorHold              * silent! checktime
augroup END

augroup CursorLine
  autocmd!
  autocmd WinEnter,InsertLeave * set cursorline
  autocmd WinLeave,InsertEnter * set nocursorline
augroup END

augroup FastEscape
  autocmd!
  au InsertEnter,CmdlineEnter  * set timeoutlen=200
  au InsertLeave,CmdlineLeave * set timeoutlen=1000
augroup END

augroup LastCursor
  autocmd!
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe 'normal g`"' |
        \ endif
augroup END

augroup Formatting
  autocmd!
  autocmd BufWritePre * : %s/\s\+$//e
  autocmd FileType elixir,ruby
        \ autocmd BufWritePre * : %s/	/  /ge
  autocmd FileType elixir,ruby
        \ autocmd BufWritePre * : %s/\n\n\n\+//e
augroup END
