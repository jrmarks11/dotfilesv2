" If you go more than 5 j or k add to jumplist. If there is no count use gj gk
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Opposite of J
nnoremap K i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Q to replay q register in normal and visual
nnoremap Q @q
xnoremap Q :'<,'> :normal @q<cr>

" Execute . on a visual range
xnoremap . :normal .<cr>

" Y does Y not work like this by default
nnoremap Y y$

" This does what it sounds like and its great
nnoremap \ :SecondToLastBuffer<cr>

" Dont ever need to jump with '
nnoremap ' `
xnoremap ' `

" Using clever f so dont need ;
nnoremap ; :
xnoremap ; :

" Clear search results when using c-l in normal, maintains c-l
nnoremap <c-l> :nohlsearch<c-r>=has('diff')?'<bar>diffupdate':''<cr><cr>:syntax sync fromstart<cr><c-l>

" mark position before searching
nnoremap / ms/
nnoremap ? ms?

xnoremap * :<c-u>call vistar#search('/')<cr>/<c-r>=@/<cr><cr>
xnoremap # :<c-u>call vistar#search('?')<cr>?<c-r>=@/<cr><cr>
