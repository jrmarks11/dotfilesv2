augroup AutoResize
  autocmd!
  autocmd VimResized * wincmd =
augroup END

augroup AutoSaveAndRead
  autocmd!
  autocmd InsertLeave,TextChanged * silent! FixAllWhitespace
  autocmd InsertLeave,TextChanged * silent! wall
  autocmd CursorHold              * silent! checktime
augroup END

augroup CursorLine
  autocmd!
  autocmd WinEnter,InsertLeave * set cursorline
  autocmd WinLeave,InsertEnter * set nocursorline
augroup END

augroup EnsureDirectoryExists
  autocmd!
  autocmd BufNewFile * call util#ensure_directory_exists()
augroup END

augroup FastEscape
  autocmd!
  au InsertEnter,CmdlineEnter * set timeoutlen=200
  au InsertLeave,CmdlineLeave * set timeoutlen=1000
augroup END

augroup LastCursor
  autocmd!
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe 'normal g`"' |
        \ endif
augroup END

augroup Org
  autocmd!
  autocmd FileType org,outline setlocal nofoldenable
augroup END
