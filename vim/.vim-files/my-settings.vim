" list of regex checked for alternate files first maps to second
let g:alt_file_patterns =
      \ [
      \     [ 'spec\/lib\/\(.*\)_spec.rb', 'lib\/\1.rb' ],
      \     [ 'lib\/\(.*\).rb', 'spec\/lib\/\1_spec.rb' ],
      \     [ 'spec\/\(.*\)_spec.rb', 'app\/\1.rb' ],
      \     [ 'app\/\(.*\).rb', 'spec\/\1_spec.rb' ],
      \     [ 'test\/\(.*\)_test.exs', 'lib\/\1.ex' ],
      \     [ 'lib\/\(.*\).ex', 'test\/\1_test.exs' ],
      \     [ '.*\/.vim-files.*vim', '~\/.vimrc' ],
      \     [ '.*\/.bashrc_files.*sh', '~\/.bashrc' ],
      \ ]
