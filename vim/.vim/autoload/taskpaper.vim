function taskpaper#done()
  let l:line = getline('.')
  if l:line =~# '@done'
    return 0
  endif

  let l:time = strftime('%Y-%m-%d', localtime())
  let l:tagged_line = l:line . ' @done('. l:time . ')'
  call setline('.', l:tagged_line)
  normal! j
  return 1
endfunction

function taskpaper#toggle()
  if !taskpaper#done()
    call taskpaper#undo()
  endif
endfunction

function taskpaper#undo()
  let l:undo_line = substitute(getline('.'), ' @done(.*)', '', 'g')
  call setline('.', l:undo_line)
endfunction
