scriptencoding utf-8
let g:mapleader=','

" expirimental
nmap <SPACE>d "_d
nmap <SPACE>p "0p
nnoremap Q @q
xnoremap Q :'<,'> :normal @q<CR>
xnoremap . :norm.<CR>

" command
nnoremap <SPACE>%       :%s/\<<C-R><C-W>\>//g<LEFT><LEFT>
nnoremap <SPACE><SPACE> :'{,'}s/\<<C-R><C-W>\>//g<LEFT><LEFT>
nmap     <SPACE><TAB>   :b#<CR>
nmap     <SPACE>a       :A<CR>
nmap     <SPACE>b       :Buffer<CR>
nmap     <SPACE>c       :GitGutterLineHighlightsToggle<CR>
nmap     <SPACE>ff      :FzfVimGrep<SPACE>
nmap     <SPACE>fr      :History<CR>
nmap     <SPACE>fw      :FzfVimGrep<SPACE><C-R><C-W><CR>
nmap     <SPACE>gb      :Gblame<CR>
nmap     <SPACE>gd      :Gdiff<CR>
nmap     <SPACE>i       :BLines<CR>
nmap     <SPACE>I       :Lines<CR>
nmap     <SPACE>l       :ALEToggle<CR>
nmap     <SPACE>rl      :RspecLine<CR>
nmap     <SPACE>rs      :RspecFile<CR>
nmap     <SPACE>t       :Files<CR>
nmap     <SPACE>u       :PlugUpdate<CR>
nmap     <SPACE>U       :PlugClean<CR>
nmap     <SPACE>v       :source $MYVIMRC<CR>

" tmux
nnoremap <silent> <C-J>h :TmuxNavigateLeft<CR>
nnoremap <silent> <C-J>j :TmuxNavigateDown<CR>
nnoremap <silent> <C-J>k :TmuxNavigateUp<CR>
nnoremap <silent> <C-J>l :TmuxNavigateRight<CR>
nnoremap <silent> <C-J>b :TmuxNavigatePrevious<CR>

" %% expands to current path in command mode
cnoremap <expr> %%  getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'

" Clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

xmap     ga     <Plug>(EasyAlign)
nmap     ga     <Plug>(EasyAlign)
nmap     Y      y$
nnoremap <C-J>  <C-W>
nnoremap <C-J>x <C-W>q
