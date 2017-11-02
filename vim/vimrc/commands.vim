function Rspec_line_cb()
  execute ":wa"
  execute ":let @* = \"" . "bundle exec rspec " . bufname("%") . ':'
        \ . line(".") . " --format d\""
endfunction
command Rspeclinecb call Rspec_line_cb()

function Rspec_line()
  execute ":wa"
  execute "!" . "bundle exec rspec " . bufname("%") . ':' . line(".")
        \ . " --format d"
endfunction
command Runspecline call Rspec_line()

function Rspec_file()
  execute ":wa"
  execute "!" . "bundle exec rspec " . bufname("%") . " --format d"
endfunction
command Runspecfile call Rspec_file()

function Rspec_cb()
  execute ":wa"
  execute ":let @* = \"" . "bundle exec rspec " . bufname("%")
        \ . " --format d\""
endfunction
command Rspeccb call Rspec_cb()

command -bang -nargs=* FzfVimGrep call
      \ fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings
      \ --ignore-case --hidden --follow --glob "!.git/*" --color "always" '
      \ .shellescape(<q-args>), 1, <bang>0)
