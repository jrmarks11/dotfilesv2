scriptencoding utf-8
let g:mapleader='s'

nnoremap <space><space> :'{,'}s/\<<c-r><c-w>\>//g<left><left>
nnoremap <space><tab>   :b#<cr>
nnoremap <space>a       :A<cr>
nnoremap <space>b       :Buffer<cr>
nnoremap <space>c       :GitGutterLineHighlightsToggle<cr>
nnoremap <space>d       orequire 'pry'<cr>binding.pry<esc>
xnoremap <space>f       y:FzfVimGrep<space><c-r>0<cr>
nnoremap <space>ff      :FzfVimGrep<space>
nnoremap <space>fr      :History<cr>
nnoremap <space>fw      :FzfVimGrep<space><c-r><c-w><cr>
nnoremap <space>i       :BLines<cr>
xnoremap <space>g       :<c-u>!git blame <c-r>=expand('%:p')<cr> \|
                        \sed -n <c-r>=line("'<")<cr>,<c-r>=line("'>")<cr>p <cr>
nnoremap <space>g       :!git blame <c-r>=expand('%:p')<cr> \|
                        \ sed -n <c-r>=line('.')<cr>,<c-r>=line('.')<cr>p <cr>
nnoremap <space>l       :ALEToggle<cr>
nnoremap <space>p       :set paste<cr>]p:set nopaste<cr>
nnoremap <space>rl      :RspecLine<cr>
nnoremap <space>rs      :RspecFile<cr>
nnoremap <space>s       :%s/\<<c-r><c-w>\>//g<left><left>
nnoremap <space>t       :Files<cr>
nnoremap <space>u       :PlugUpdate<cr>
nnoremap <space>x       :PlugClean<cr>
nnoremap <space>y       ?require \'p<cr>dj
nnoremap <space>v       :source $MYVIMRC<cr>

nnoremap Q @q
xnoremap Q :'<,'> :normal @q<cr>
xnoremap . :norm.<cr>
nnoremap ' `
nnoremap ` '
nnoremap Y y$

nmap     s  <nop>
xmap     s  <nop>
nnoremap sj :SplitjoinJoin<cr>
nnoremap ss :SplitjoinSplit<cr>
nnoremap st :Switch<cr>
xmap     sl <Plug>(EasyAlign)
nmap     sl <Plug>(EasyAlign)

inoremap ,.     <c-x><c-l>
inoremap ,<tab> <c-x><c-o>
inoremap ,,     <c-x><c-p>

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
