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

function Buflisted()
  let s:no_qf =  "buflisted(v:val) && getbufvar(v:val, '&filetype') !=# 'qf'"
  return filter(range(1, bufnr('$')), s:no_qf)
endfunction

function Sort_buffers(...)
  " using fzf to track the buffer order
  let [s:b1, s:b2] = map(copy(a:000), 'get(g:fzf#vim#buffers, v:val, v:val)')
  " Using minus between a float and a number in a sort function causes an error
  return s:b1 < s:b2 ? 1 : -1
endfunction

function Second_to_last()
  let s:sorted = sort(Buflisted(), 'Sort_buffers')
  if len(s:sorted) > 2
    execute 'b' . s:sorted[2]
  end
endfunction
command SecondToLastBuffer call Second_to_last()

