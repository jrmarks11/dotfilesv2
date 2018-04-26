" File completion
inoremap <silent> ;f <c-x><c-f>

" Line completion
inoremap <silent> ;d <c-x><c-l>

" ;n for next word completion
inoremap <silent> ;n <c-x><c-n>

" Mapped ;; instead of ;p since its the most common one and ;p is hard to type
inoremap <silent> ;; <c-x><c-p>

" Mapped ;t instead of ;] because ;] is hard to type tag completion
inoremap <silent> ;t <c-x><c-]>

" Save c-u and c-w in the undo register
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" Easy string and brace addition in insert mode
imap <c-s> <esc><Plug>(operator-sandwich-add)iw'Ea
imap <c-b> <esc><Plug>(operator-sandwich-add)iw{ea
