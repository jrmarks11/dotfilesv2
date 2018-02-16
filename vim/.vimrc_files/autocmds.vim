augroup AutoResize
  au!
  au VimResized * wincmd =
augroup END

augroup AutoSaveAndRead
  au!
  au InsertLeave,TextChanged * silent! wall | silent! GitGutter
  au CursorHold              * silent! checktime
augroup END

augroup Formatting
  au!
  " Remove extra newlines and trailng whitspace when saving
  au BufWritePre * : %s/\n\n\n\+//e | %s/\s\+$//e
augroup END

augroup vimrcEx
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler.
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END
