if exists('g:loaded_jm_commands')
  finish
else
  let g:loaded_jm_commands = 1
endif

function! PromoteToLet()
  :normal! dd
  :normal! P
  :s/\(\S\+\)\s*=\s*\(\S*\)$/let(:\1) { \2 }/
  :normal! ==
endfunction
:command! PromoteToLet :call PromoteToLet()

function! DemoteFromLet()
  :normal! dd
  :normal! P
  :s/let(:\(\S*\))\s*{\s*\(\S\+\)\s*}/\1 = \2/
  :normal! ==
endfunction
:command! DemoteFromLet :call DemoteFromLet()

function Rspec_line()
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
  execute ':let @* = "' . 'bundle exec rspec ' . bufname('%') . ':'
        \ . line('.') . ' --format d"'
endfunction
command RspecLineCopy call Rspec_line_copy()

function Rspec_file()
  if exists('$TMUX')
    execute ':Tmux ' . 'bundle exec rspec ' . bufname('%')
          \ . ' --format d'
  else
    execute '!' . 'bundle exec rspec ' . bufname('%') . ' --format d'
  endif
endfunction
command RspecFile call Rspec_file()

function Rspec_file_copy()
  execute ':let @* = "' . 'bundle exec rspec ' . bufname('%')
        \ . ' --format d"'
endfunction
command RspecFileCopy call Rspec_file_copy()

command -bang -nargs=* FzfVimGrep call
      \ fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings
      \ --ignore-case --hidden --follow --glob "!.git/*" --color "always" '
      \ .shellescape(<q-args>), 1, <bang>0)
