let g:alt_file_patterns =
      \ [
      \     [ 'spec\/lib\/\(.*\)_spec.rb', 'lib\/\1.rb' ],
      \     [ 'lib\/\(.*\).rb', 'spec\/lib\/\1_spec.rb' ],
      \     [ 'spec\/\(.*\)_spec.rb', 'app\/\1.rb' ],
      \     [ 'app\/\(.*\).rb', 'spec\/\1_spec.rb' ],
      \     [ '.*vimrc_files\/.*.vim', '~/.vimrc' ]
      \ ]
command! A call util#alt_file()

command! -bang -nargs=* FzfVimGrep call
      \ fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings
      \ --ignore-case --hidden --follow --glob "!.git/*" --color "always" '
      \ .shellescape(<q-args>), 1, <bang>0)

let s:options =
  \ '--reverse '.
  \ '--preview "(git diff --color=always master -- {} | tail -n +5 || cat {})'.
  \ '2> /dev/null | head -' . &lines . '"'
let s:gs = "(git status --porcelain | awk '{print $2}')|sort|uniq"
let s:no = '(git diff --name-only HEAD $(git merge-base HEAD master))|sort|uniq'
let s:bf_opts = { 'source': s:gs, 'sink': 'e', 'options': s:options }
let s:uf_opts = { 'source': s:no, 'sink': 'e', 'options': s:options }
command! BranchFiles call fzf#run(fzf#wrap('BranchFiles', s:uf_opts, 0))
command! UncommitedFiles call fzf#run(fzf#wrap('UncommitedFiles', s:bf_opts, 0))

command! RspecFile call util#rspec_command('')
command! RspecLine call util#rspec_command(':' . line('.'))
command! SecondToLastBuffer call util#second_to_last()
