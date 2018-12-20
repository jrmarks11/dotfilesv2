function! php#unit_command(...)
  let l:base = exists('$TMUX') ? ':Tmux ' : '!'
  let l:extra = get(a:, 1, '')
  execute l:base . 'phpunit ' . bufname('%') . l:extra
endfunction
