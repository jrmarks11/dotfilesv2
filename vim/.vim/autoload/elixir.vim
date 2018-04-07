function! elixir#test_command(...)
  let l:base = exists('TMUX') ? ':Tmux ' : '!'
  let l:prefix = (a:0 > 1) ? 'iex -S ' : ''
  let l:extra = (a:0 > 0) ? a:1 : ''
  execute l:base . l:prefix . 'mix test --trace ' . bufname('%') . l:extra
endfunction
