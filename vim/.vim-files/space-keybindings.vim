nnoremap <space><space> :'{,'}s/\<<c-r><c-w>\>//g<left><left>
xnoremap <space><space> y:'{,'}s/<c-r><c-0>//g<left><left>
nnoremap <space><tab> :LastBuffer<cr>
nnoremap <space>a :A<cr>
nnoremap <space>b :Buffer<cr>
"        <space>c Files (c)ontrollers
nnoremap <space>d :FindCurrentDir<cr>
nnoremap <space>e e
nnoremap <space>f :Rg!<space><c-r><c-w><cr>
xnoremap <space>f y:Rg!<space><c-r>0<cr>
nnoremap <space>gf :e <cfile><cr>
nnoremap <space>h :help<space><c-r><c-w><cr>
nnoremap <space>i :BLines!<cr>
nnoremap <space>j :Rg!<space>
"        <space>k Files test or spec spe(k)
nnoremap <space>l l
"        <space>m Files (m)odels
nnoremap <space>n :BranchFiles!<cr>
nnoremap <space>o o
nnoremap <space>p :NoPastePaste<cr>
nnoremap <space>q q
nnoremap <space>r :History<cr>
nnoremap <space>s :%s/\<<c-r><c-w>\>//g<left><left>
xnoremap <space>s y:%s/<c-r><c-0>//g<left><left>
nnoremap <space>t :Files!<cr>
nnoremap <space>u :UncommitedFiles!<cr>
nnoremap <space>v :source $MYVIMRC<cr>
nnoremap <space>w w
nnoremap <space>x x
nnoremap <space>y :Helptags<cr>
nnoremap <space>z z

if util#has_top_file('Gemfile.lock')
  nnoremap <space>c :Files! app/controllers/<cr>
  nnoremap <space>m :Files! app/models/<cr>
  nnoremap <space>k :Files! spec/<cr>
elseif util#has_top_file('mix.exs')
  nnoremap <space>c :Files! lib/*_web/controllers/<cr>
  nnoremap <space>m :Files! lib/<cr>
  nnoremap <space>k :Files! test/<cr>
endif
