function util#alt_file()
  let l:file = expand('%')
  for [l:pattern, l:substitution] in g:alt_file_patterns
    if l:file =~ l:pattern
      execute 'e '. substitute(l:file, l:pattern, l:substitution, 'g')
      return
    endif
  endfor
endfunction

function util#buflisted()
  let l:no_qf = "buflisted(v:val) && getbufvar(v:val, '&filetype') !=# 'qf'"
  return filter(range(1, bufnr('$')), l:no_qf)
endfunction

function util#rspec_command(extra)
  if exists('$TMUX')
    let l:base = ':Tmux '
  else
    let l:base = '!'
  endif
  execute l:base . 'bundle exec rspec ' . bufname('%') . a:extra . ' --format d'
endfunction

function util#second_to_last()
  let l:sorted = sort(util#buflisted(), 'util#sort_buffers')
  if len(l:sorted) > 2
    execute 'b' . l:sorted[2]
  endif
endfunction

function util#sort_buffers(...)
  " using fzf to track the buffer order
  let [l:b1, l:b2] = map(copy(a:000), 'get(g:fzf#vim#buffers, v:val, v:val)')
  " Using minus between a float and a number in a sort function causes an error
  return l:b1 < l:b2 ? 1 : -1
endfunction
