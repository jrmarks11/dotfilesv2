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
  let l:line = getline('.')
  let l:prefix = substitute(l:line, '^\(\W*-\W\).*$', '\1', 'g')
  normal! "xDo

  if(l:prefix =~# '\W*-\W')
    call setline('.', l:prefix . @x)
    normal! 0w
  else
    call setline('.', @x)
    normal! 0
  endif

  let @x=''
  startinsert
  return ''
endfunction

function taskpaper#o(...)
  let l:line = getline('.')
  let l:prefix = substitute(l:line, '^\(\W*-\W\).*$', '\1', 'g')

  if(a:0)
    normal! O
  else
    normal! o
  endif

  if(l:prefix =~# '\W*-\W')
    call setline('.', l:prefix)
  endif
  startinsert!
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
