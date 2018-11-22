nnoremap <space><space> :'{,'}s/\<<c-r><c-w>\>//g<left><left>
xnoremap <space><space> y:'{,'}s/<c-r><c-0>//g<left><left>
nnoremap <space><tab> :LastBuffer<cr>
nnoremap <space>a :A<cr>
nnoremap <space>b :Buffer<cr>
nnoremap <space>c :Fd! controller<cr>
nnoremap <space>d :DFiles<cr>
map      <space>e :e %%
nnoremap <space>f :Rg!<space><c-r><c-w><cr>
xnoremap <space>f y:Rg!<space><c-r>0<cr>
nnoremap <space>gf :e <cfile><cr>
nnoremap <space>h :help<space><c-r><c-w><cr>
nnoremap <space>i :BLines!<cr>
nnoremap <space>j :Rg!<space>
nnoremap <space>k :Files! ~/.vim/plugin/keybindings<cr>
nnoremap <space>l l
nnoremap <space>m m
nnoremap <space>n :BranchFiles!<cr>
nnoremap <space>o :BTags<cr>
nnoremap <space>p :NoPastePaste<cr>
nnoremap <space>q q
nnoremap <space>r :HistoryWithPreview!<cr>
nnoremap <space>s :%s/\<<c-r><c-w>\>//g<left><left>
xnoremap <space>s y:%s/<c-r><c-0>//g<left><left>
nnoremap <space>t :Files!<cr>
nnoremap <space>u :UncommitedFiles!<cr>
nnoremap <space>v :source $MYVIMRC<cr>
nnoremap <space>w w
nnoremap <space>x x
nnoremap <space>y :Helptags<cr>
nnoremap <space>z z
