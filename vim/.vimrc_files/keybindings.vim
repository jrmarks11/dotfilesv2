scriptencoding utf-8
let g:mapleader='s'

nnoremap <SPACE><SPACE> :'{,'}s/\<<C-R><C-W>\>//g<LEFT><LEFT>
nnoremap <SPACE><TAB>   :b#<CR>
nnoremap <SPACE>a       :A<CR>
nnoremap <SPACE>b       :Buffer<CR>
nnoremap <SPACE>c       :GitGutterLineHighlightsToggle<CR>
vnoremap <SPACE>f       y:FzfVimGrep<SPACE><C-R>0<CR>
nnoremap <SPACE>ff      :FzfVimGrep<SPACE>
nnoremap <SPACE>fr      :History<CR>
nnoremap <SPACE>fw      :FzfVimGrep<SPACE><C-R><C-W><CR>
nnoremap <SPACE>gb      :Gblame<CR>
nnoremap <SPACE>gd      :Gdiff<CR>
nnoremap <SPACE>i       :BLines<CR>
nnoremap <SPACE>l       :ALEToggle<CR>
nnoremap <SPACE>rl      :RspecLine<CR>
nnoremap <SPACE>rs      :RspecFile<CR>
nnoremap <SPACE>s       :%s/\<<C-R><C-W>\>//g<LEFT><LEFT>
nnoremap <SPACE>t       :Files<CR>
nnoremap <SPACE>u       :PlugUpdate<CR>
nnoremap <SPACE>x       :PlugClean<CR>
nnoremap <SPACE>v       :source $MYVIMRC<CR>

nnoremap <SILENT><C-J>h :TmuxNavigateLeft<CR>
nnoremap <SILENT><C-J>j :TmuxNavigateDown<CR>
nnoremap <SILENT><C-J>k :TmuxNavigateUp<CR>
nnoremap <SILENT><C-J>l :TmuxNavigateRight<CR>
nnoremap <SILENT><C-J>b :TmuxNavigatePrevious<CR>

nnoremap <C-J>          <C-W>
nnoremap <C-J>x         <C-W>q
nnoremap Q              @q
xnoremap Q              :'<,'>  :normal @q<CR>
xnoremap .              :norm.<CR>
nnoremap     '              `
nnoremap     `              '
nmap     s              <NOP>
xmap     s              <NOP>
nmap     Y              y$

nnoremap <LEADER>j      :SplitjoinJoin<cr>
nnoremap <LEADER>s      :SplitjoinSplit<cr>
nnoremap <LEADER>t      :Switch<cr>
xnoremap <CR>           <Plug>(EasyAlign)
nnoremap <LEADER>l      <Plug>(EasyAlign)

inoremap ,.             <C-X><C-L>
inoremap ,<TAB>         <C-X><C-O>
inoremap ,,             <C-X><C-P>

" %% expands to current path in command mode
cnoremap <expr> %%  getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'

" Clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
