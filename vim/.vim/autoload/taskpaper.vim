function taskpaper#archive(line)
  call cursor(search('Archive:'), '0')
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
  let l:prefix = taskpaper#prefix()
  let l:x_saved = @x

  if col('.') == col('$')
    call taskpaper#o()
    return ''
  end

  normal! "xDo
  if(l:prefix =~# '\W*-\W')
    call setline('.', l:prefix . @x)
    normal! 0w
  else
    call setline('.', @x)
    normal! 0
  endif

  let @x = l:x_saved
  return ''
endfunction

function taskpaper#o(...)
  let l:prefix = taskpaper#prefix()
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

function taskpaper#prefix()
  return substitute(getline('.'), '^\(\W*-\W\).*$', '\1', 'g')
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
