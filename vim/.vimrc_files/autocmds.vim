augroup AutoResize
  autocmd!
  autocmd VimResized * wincmd =
augroup END

augroup AutoSaveAndRead
  autocmd!
  autocmd InsertLeave,TextChanged * silent! wall | silent! GitGutter
  autocmd CursorHold              * silent! checktime
augroup END

augroup Formatting
  autocmd!
  " Remove extra newlines and trailng whitspace when saving
  autocmd BufWritePre * : %s/\n\n\n\+//e | %s/\s\+$//e
augroup END

augroup Vimrc
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler.
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END
