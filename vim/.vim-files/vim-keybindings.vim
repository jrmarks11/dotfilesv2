" Include flags when redoing the last substitution
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" If you go more than 5 j or k add to jumplist. If there is no count use gj gk
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Q to replay q register in normal and visual
nnoremap Q @q
xnoremap Q :'<,'> :normal @q<cr>
" Execute . on a visual range
xnoremap . :normal .<cr>

" Opposite of J i think of it as Join and Split
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Y does Y not work like this by default
nnoremap Y y$

" This does what it sounds like and its great
nnoremap \ :SecondToLastBuffer<cr>

" dont ever need to jump with '
nnoremap ' `

" using clever-f so ; is not needed
nnoremap ; :

" clear search results when using c-l in normal, maintains c-l
nnoremap <c-l> :nohlsearch<c-r>=has('diff')?'<Bar>diffupdate':''<cr><cr><c-l>
