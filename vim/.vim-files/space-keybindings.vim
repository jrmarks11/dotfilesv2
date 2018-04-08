nnoremap <space><space> :'{,'}s/\<<c-r><c-w>\>//g<left><left>
xnoremap <space><space> y:'{,'}s/<c-r><c-0>//g<left><left>
nnoremap <space><tab> :LastBuffer<cr>
nnoremap <space>a :A<cr>
nnoremap <space>b :Buffer<cr>
nnoremap <space>c :UncommitedFiles!<cr>
nnoremap <space>d :set relativenumber!<cr>
nnoremap <space>e :History<cr>
nnoremap <space>f :Rg!<space><c-r><c-w><cr>
xnoremap <space>f y:Rg!<space><c-r>0<cr>
nnoremap <space>gf :e <cfile><cr>
nnoremap <space>h :help<space><c-r><c-w><cr>
nnoremap <space>i :BLines!<cr>
nnoremap <space>j :Rg!<space>
nnoremap <space>k k
nnoremap <space>l l
nnoremap <space>m m
nnoremap <space>n :BranchFiles!<cr>
"        <space>o put pry above this line
nnoremap <space>p :set paste<cr>o<esc>]p:set nopaste<cr>
nnoremap <space>q q
"        <space>r run test for the current line
nnoremap <space>s :%s/\<<c-r><c-w>\>//g<left><left>
xnoremap <space>s y:%s/<c-r><c-0>//g<left><left>
nnoremap <space>t :Files!<cr>
"        <space>r run test for the current file
nnoremap <space>v :source $MYVIMRC<cr>
"        <space>w  remove debug statements
nnoremap <space>x x
nnoremap <space>y :Helptags<cr>
nnoremap <space>z z

if util#has_top_file('Gemfile.lock')
  nnoremap <space>gk :Files! app/controllers/<cr>
  nnoremap <space>gm :Files! app/models/<cr>
  nnoremap <space>gu :Files! spec/<cr>
elseif util#has_top_file('mix.exs')
  nnoremap <space>gk :Files! lib/*_web/controllers/<cr>
  nnoremap <space>gm :Files! lib/<cr>
  nnoremap <space>gu :Files! test/<cr>
endif
