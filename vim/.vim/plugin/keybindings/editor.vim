" If you go more than 5 j or k add to jumplist. If there is no count use gj gk
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Q to replay q register in normal and visual
nnoremap Q @q
xnoremap Q :'<,'> :normal @q<cr>

" Execute . on a visual range
xnoremap . :normal .<cr>

" Opposite of J
nnoremap K i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Y does Y not work like this by default
nnoremap Y y$

" This does what it sounds like and its great
nnoremap \ :SecondToLastBuffer<cr>

" Dont ever need to jump with '
nnoremap ' `
xnoremap ' `

nnoremap ; :
xnoremap ; :

" Keep visual selection when moving
xnoremap > >gv
xnoremap < <gv

" Clear search results when using c-l in normal, maintains c-l
nnoremap <c-l> :nohlsearch<c-r>=has('diff')?'<Bar>diffupdate':''<cr><cr><c-l>

nnoremap z= :setlocal spell<CR>z=

" mark position before searching
nnoremap / ms/
