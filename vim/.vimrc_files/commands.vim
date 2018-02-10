if exists('g:loaded_jm_commands')
  finish
else
  let g:loaded_jm_commands = 1
endif

function Git_blame(start, end)
  execute '!git blame ' . expand('%:p') . ' | sed -n '. line(a:start). ','
        \ . line(a:end) . 'p'
endfunction

function Rspec_command(extra)
  if exists('$TMUX')
    let s:base = ':Tmux '
  else
    let s:base = '!'
  endif
  execute s:base . 'bundle exec rspec ' . bufname('%') . a:extra . ' --format d'
endfunction
command RspecFile call Rspec_command('')
command RspecLine call Rspec_command(':' . line('.'))

command -bang -nargs=* FzfVimGrep call
      \ fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings
      \ --ignore-case --hidden --follow --glob "!.git/*" --color "always" '
      \ .shellescape(<q-args>), 1, <bang>0)
