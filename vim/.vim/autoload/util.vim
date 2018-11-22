function! util#all_files()
  let l:sorted = sort(util#buflisted(), 'util#sort_buffers')

  return fzf#vim#_uniq(map(
        \ filter([expand('%')], 'len(v:val)')
        \   + filter(map(l:sorted, 'bufname(v:val)'), 'len(v:val)')
        \   + filter(copy(v:oldfiles), 'filereadable(expand(v:val))'),
        \ "fnamemodify(v:val, ':~:.')"))
endfunction

function! util#alt_file()
  let l:file = expand('%')
  for [l:pattern, l:substitution] in g:alt_file_patterns
    if l:file =~ l:pattern
      execute 'e '. substitute(l:file, l:pattern, l:substitution, 'g')
      return
    endif
  endfor
endfunction

function! util#buflisted()
  let l:no_qf = "buflisted(v:val) && getbufvar(v:val, '&filetype') !=# 'qf'"
  return filter(range(1, bufnr('$')), l:no_qf)
endfunction

function! util#ensure_directory_exists()
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

function! util#files_same_dir()
  execute ':Files! ' . fnameescape(expand('%:h')).'/'
endfunction

function! util#fix_all_whitespace(line1, line2)
  let l:save_cursor = getpos('.')
  execute a:line1.','.a:line2.'FixWhitespace'
  if(&filetype ==# 'ruby' || &filetype ==# 'elixir')
    call util#fix_tabs(a:line1, a:line2)
    call util#fix_extra_lines(a:line1, a:line2)
  endif
  call setpos('.', l:save_cursor)
endfunction

function! util#fix_extra_lines(line1,line2)
  let l:save_cursor = getpos('.')
  silent! execute ':' . a:line1 . ',' . a:line2 . 's/\n\n\n\+//g'
  call setpos('.', l:save_cursor)
endfunction

function! util#fix_tabs(line1,line2)
  let l:save_cursor = getpos('.')
  silent! execute ':' . a:line1 . ',' . a:line2 . 's/	/  /g'
  call setpos('.', l:save_cursor)
endfunction

function! util#last_buffer(count)
  let l:sorted = util#all_files()
  if len(l:sorted) > a:count
    execute 'e ' . l:sorted[a:count]
  endif
endfunction

function! util#no_paste_paste()
  set paste
  normal! o
  normal! ]p
  FixTabs
  set nopaste
endfunction

function! util#rename_file()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

function! util#sort_buffers(...)
  let [l:b1, l:b2] = map(copy(a:000), 'get(g:fzf#vim#buffers, v:val, v:val)')
  " Using minus between a float and a number in a sort function causes an error
  return l:b1 < l:b2 ? 1 : -1
endfunction
