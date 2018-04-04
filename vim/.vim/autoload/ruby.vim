function! ruby#rspec_command(extra)
  if exists('$TMUX')
    let l:base = ':Tmux '
  else
    let l:base = '!'
  endif
  execute l:base . 'bundle exec rspec ' . bufname('%') . a:extra . ' --format d'
endfunction

function! ruby#set_ruby_mark()
  if expand('%:t') =~# '/*_spec\.rb'
    normal! mS
  else
    normal! mR
  end
endfunction
