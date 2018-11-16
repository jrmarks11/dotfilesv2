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

augroup ensure_directory_exists
  autocmd!
  autocmd BufNewFile * call s:EnsureDirectoryExists()
augroup END

function! s:EnsureDirectoryExists()
  let required_dir = expand("%:h")

  if !isdirectory(required_dir)
    if !confirm("Directory '" . required_dir . "' doesn't exist. Create it?")
      return
    endif

    try
      call mkdir(required_dir, 'p')
    catch
      echoerr "Can't create '" . required_dir . "'"
    endtry
  endif
endfunction
