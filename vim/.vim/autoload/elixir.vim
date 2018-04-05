function! elixir#test_command(extra)
  if exists('$TMUX')
    let l:base = ':Tmux '
  else
    let l:base = '!'
  endif
  execute l:base . 'iex -S mix test ' . bufname('%') . a:extra
endfunction
