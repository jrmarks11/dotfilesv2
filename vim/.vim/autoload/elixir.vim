function! elixir#test_command(extra, bang)
  let l:base = exists('$TMUX') ? ':Tmux ' : '!'
  let l:prefix = (a:bang == 1) ? 'iex -S ' : ''
  execute l:base . l:prefix . 'mix test --trace ' . bufname('%') . a:extra
endfunction
