nnoremap <space><space> :'{,'}s/\<<c-r><c-w>\>//g<left><left>
xnoremap <space><space> y:'{,'}s/<c-r><c-0>//g<left><left>
nnoremap <space><tab> :SuperCarrot<cr>
nnoremap <space>a :A<cr>
nnoremap <space>d :DFiles<cr>
nnoremap <space>f :MyRg!<space><c-r><c-w><cr>
xnoremap <space>f y:MyRg!<space><c-r>0<cr>
nnoremap <space>j :MyRg!<space>
nnoremap <space>o :MyRg!<space>[<space>]<cr>
nnoremap <space>p :NoPastePaste<cr>
nnoremap <space>r :MRU!<cr>
nnoremap <space>s :%s/\<<c-r><c-w>\>//g<left><left>
xnoremap <space>s y:%s/<c-r><c-0>//g<left><left>
nnoremap <space>t :Files!<cr>

nnoremap <space>gf :e <cfile><cr>
