function Rspec_line()
  execute ':wa'
  if exists('$TMUX')
    execute ':Tmux ' . 'bundle exec rspec ' . bufname('%') . ':'
          \ . line('.') . ' --format d'
  else
    execute '!' . 'bundle exec rspec ' . bufname('%') . ':' . line('.')
          \ . ' --format d'
  endif
endfunction
command RspecLine call Rspec_line()

function Rspec_line_copy()
  execute ':wa'
  execute ':let @* = "' . 'bundle exec rspec ' . bufname('%') . ':'
        \ . line('.') . ' --format d"'
endfunction
command RspecLineCopy call Rspec_line_copy()

function Rspec_file()
  execute ':wa'
  if exists('$TMUX')
    execute ':Tmux ' . 'bundle exec rspec ' . bufname('%')
          \ . ' --format d'
  else
    execute '!' . 'bundle exec rspec ' . bufname('%') . ' --format d'
  endif
endfunction
command RspecFile call Rspec_file()

function Rspec_file_copy()
  execute ':wa'
  execute ':let @* = "' . 'bundle exec rspec ' . bufname('%')
        \ . ' --format d"'
endfunction
command RspecFileCopy call Rspec_file_copy()

command -bang -nargs=* FzfVimGrep call
      \ fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings
      \ --ignore-case --hidden --follow --glob "!.git/*" --color "always" '
      \ .shellescape(<q-args>), 1, <bang>0)
