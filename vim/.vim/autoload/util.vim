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

function util#find_current_dir()
  execute ':Files! ' . fnameescape(expand('%:h')).'/'
endfunction

function! util#fix_tabs(line1,line2)
  let l:save_cursor = getpos('.')
  silent! execute ':' . a:line1 . ',' . a:line2 . 's/	/  /g'
  call setpos('.', l:save_cursor)
endfunction

function! util#has_top_file(name)
  let l:message = system('git top | xargs ls | rg ' . a:name)
  return l:message =~ a:name
endfunction

function! util#last_buffer(count)
  let l:sorted = util#all_files()
  if len(l:sorted) > a:count
    execute 'e ' . l:sorted[a:count]
  endif
endfunction

function util#no_paste_paste()
  set paste
  normal! o
  normal! ]p
  FixTabs
  set nopaste
endfunction

function! util#sort_buffers(...)
  let [l:b1, l:b2] = map(copy(a:000), 'get(g:fzf#vim#buffers, v:val, v:val)')
  " Using minus between a float and a number in a sort function causes an error
  return l:b1 < l:b2 ? 1 : -1
endfunction
