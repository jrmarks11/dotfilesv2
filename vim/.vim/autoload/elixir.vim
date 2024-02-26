function! elixir#test_command(bang, ...)
  let l:base = exists('$TMUX') ? ':Tmux ' : '!'
  let l:prefix = (a:bang == 1) ? 'iex -S ' : ''
  let l:extra = get(a:, 1, '')
  execute l:base . l:prefix . 'mix test --trace ' . bufname('%') . l:extra
endfunction
