scriptencoding utf-8
let g:mapleader='s'

nnoremap <space><space> :'{,'}s/\<<c-r><c-w>\>//g<left><left>
xnoremap <space><space> y:'{,'}s/<c-r><c-0>//g<left><left>
nnoremap <space><tab>   :b#<cr>
nnoremap <space>a       :A<cr>
nnoremap <space>b       :Buffer<cr>
nnoremap <space>c       :GitGutterLineHighlightsToggle<cr>
nnoremap <space>d       Obinding.pry<esc>
xnoremap <space>f       y:FzfVimGrep<space><c-r>0<cr>
nnoremap <space>fb      :BranchFiles<cr>
nnoremap <space>ff      :FzfVimGrep<space>
nnoremap <space>fr      :History<cr>
nnoremap <space>fu      :UncommitedFiles<cr>
nnoremap <space>fw      :FzfVimGrep<space><c-r><c-w><cr>
nnoremap <space>i       :BLines<cr>
xnoremap <space>g       :<c-u>call Git_blame("'<", "'>")<cr>
nnoremap <space>g       :call Git_blame('.', '.')<cr>
nnoremap <space>l       :ALEToggle<cr>
nnoremap <space>p       :set paste<cr>]p:set nopaste<cr>
nnoremap <space>rl      :RspecLine<cr>
nnoremap <space>rs      :RspecFile<cr>
nnoremap <space>s       :%s/\<<c-r><c-w>\>//g<left><left>
xnoremap <space>s       y:%s/<c-r><c-0>//g<left><left>
nnoremap <space>t       :Files<cr>
nnoremap <space>u       :PlugUpdate<cr>
nnoremap <space>x       :PlugClean<cr>
nnoremap <space>y       :g/^\W*\<binding.pry\>$/d<cr>
nnoremap <space>v       :source $MYVIMRC<cr>

nnoremap ` '
nnoremap ' `
nnoremap \ :SecondToLastBuffer<cr>
xnoremap . :norm.<cr>
nnoremap Q @q
xnoremap Q :'<,'> :normal @q<cr>
nnoremap Y y$

nmap     s  <nop>
xmap     s  <nop>
xmap     sl <Plug>(EasyAlign)
nmap     sl <Plug>(EasyAlign)

inoremap ,.     <c-x><c-l>
inoremap ,<tab> <c-x><c-o>
inoremap ,,     <c-x><c-p>

nnoremap [<space> O<esc>j
nnoremap ]<space> o<esc>k

nnoremap <c-j>          <c-w>
nnoremap <c-j>x         <c-w>q
nnoremap <silent><c-j>h :TmuxNavigateLeft<cr>
nnoremap <silent><c-j>j :TmuxNavigateDown<cr>
nnoremap <silent><c-j>k :TmuxNavigateUp<cr>
nnoremap <silent><c-j>l :TmuxNavigateRight<cr>
nnoremap <silent><c-j>b :TmuxNavigatePrevious<cr>

" %% expands to current path in command mode
cnoremap <expr> %%  getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'

" Clear the highlighting of :set hlsearch.
nnoremap <c-l> :nohlsearch<c-r>=has('diff')?'<Bar>diffupdate':''<cr><cr><c-l>
