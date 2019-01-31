function! util#all_files()
  let l:buffers = sort(util#buflisted(), 'util#sort_buffers')
  let l:filenames = filter(map(l:buffers, 'bufname(v:val)'), 'len(v:val)')
  let l:no_current = filter(l:filenames, 'v:val != expand("%")')
  let l:oldfiles = filter(copy(v:oldfiles), "filereadable(fnamemodify(v:val, ':p'))")
  let l:current_dir = filter(l:oldfiles, '!stridx(expand(v:val), getcwd())')
  let l:all_fnames = filter(l:no_current + l:current_dir, 'expand(v:val) != expand("%:p")')

  return fzf#vim#_uniq(map(l:all_fnames, 'fnamemodify(v:val, ":~:.")'))
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
  let required_dir = expand('%:h')

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

function! util#fd(pattern)
  let l:command = 'fd --type f --hidden --follow --exclude .git ' . a:pattern
  return fzf#vim#_uniq(systemlist(l:command))
endfunction

function! util#files_same_dir()
  execute ':Files! ' . fnameescape(expand('%:h')).'/'
endfunction

function! util#fix_all_whitespace(line1, line2)
  let l:save_cursor = getpos('.')
  execute a:line1.','.a:line2.'FixWhitespace'
  if(&filetype ==# 'ruby' || &filetype ==# 'elixir' || &filetype ==# 'php')
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
  else
    execute 'e .'
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
  if new_name !=# '' && new_name != old_name
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

function! util#super_carrot()
  if @% == @#
    call util#last_buffer(0)
  else
    normal! 
  end
endfunction

function! util#zoom()
  if winnr('$') > 1
    tab split
  elseif len(filter(map(range(tabpagenr('$')), 'tabpagebuflist(v:val + 1)'),
        \ 'index(v:val, '.bufnr('').') >= 0')) > 1
    tabclose
  endif
endfunction
