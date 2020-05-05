nnoremap <space><space> :'{,'}s/\<<c-r><c-w>\>//g<left><left>
xnoremap <space><space> y:'{,'}s/<c-r><c-0>//g<left><left>
nnoremap <space><tab> :SuperCarrot<cr>
nnoremap <space>b :Buffers<cr>
nnoremap <space>d :DFiles<cr>
map      <space>e :e %%
nnoremap <space>f :Rg!<space><c-r><c-w><cr>
xnoremap <space>f y:Rg!<space><c-r>0<cr>
nnoremap <space>j :Rg!<space>
nnoremap <space>k :Files! ~/.vim/plugin/keybindings<cr>
nnoremap <space>p :NoPastePaste<cr>
nnoremap <space>r :MRU!<cr>
nnoremap <space>s :%s/\<<c-r><c-w>\>//g<left><left>
xnoremap <space>s y:%s/<c-r><c-0>//g<left><left>
nnoremap <space>t :Files!<cr>
