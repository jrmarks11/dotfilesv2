" file completion
inoremap <silent> ;f <c-x><c-f>

" line completion
inoremap <silent> ;d <c-x><c-l>

" ;n for next word completion
inoremap <silent> ;n <c-x><c-n>

" mapped ;; instead of ;p since its the most common one and ;p is hard to type
inoremap <silent> ;; <c-x><c-p>

" mapped ;t instead of ;] because ;] is hard to type tag completion
inoremap <silent> ;t <c-x><c-]>

" save c-u and c-w in the undo register
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>