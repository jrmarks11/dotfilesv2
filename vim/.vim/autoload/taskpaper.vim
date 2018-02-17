function taskpaper#archive(line)
  let l:archive_line = search('Archive:')
  call cursor(l:archive_line, '0')
  normal! p
  call cursor(a:line, '0')
endfunction

function taskpaper#archive_line()
  let l:line = getline('.') - 1
  normal! dd
  call taskpaper#archive(l:line)
endfunction

function taskpaper#archive_visual()
  let l:line = getline('<')
  '<, '>d
  call taskpaper#archive(l:line)
endfunction

function taskpaper#done()
  let l:line = getline('.')
  if l:line =~# '@done'
    return 0
  endif

  let l:time = strftime('%Y-%m-%d', localtime())
  let l:tagged_line = l:line . ' @done('. l:time . ')'
  call setline('.', l:tagged_line)
  return 1
endfunction

function taskpaper#newline()
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
