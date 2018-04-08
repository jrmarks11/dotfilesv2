function! ruby#rspec_command(...)
  let l:base = exists('$TMUX') ? ':Tmux ' : '!'
  let l:extra = get(a:, 1, '')
  execute l:base . 'bundle exec rspec ' . bufname('%') . l:extra . ' --format d'
endfunction

function! ruby#set_ruby_mark()
  if expand('%:t') =~# '/*_spec\.rb'
    normal! mS
  else
    normal! mR
  end
endfunction
