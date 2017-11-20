let g:mapleader=' '
let g:maplocalleader=','

" experimental
nmap <LEADER>, :!echo ,<CR>
nmap <LEADER>. @@
nmap <LEADER>c :GitGutterLineHighlightsToggle<CR>
nmap <LEADER>d "_d
nmap <LEADER>h <<
nmap <LEADER>j ]e
nmap <LEADER>k [e
nmap <LEADER>l :!echo l<CR>
nmap <LEADER>n }jzt
nmap <LEADER>N 2{jzt
nmap <LEADER>m }jzz
nmap <LEADER>M 2{jzz
nmap <LEADER>o :Goyo<CR>
nmap <LEADER>p "0p
nmap <LEADER>q :!echo q<CR>
nmap <LEADER>s :!echo s<CR>
nmap <LEADER>u :PlugUpdate<CR>
nmap <LEADER>w :!echo w<CR>
nmap <LEADER>y :!echo y<CR>
nmap <LEADER>z ZZ<CR>
nnoremap s <C-W>
nnoremap <LEADER><LEADER> :'{,'}s/\<<C-R><C-W>\>/
nnoremap <LEADER>% :%s/\<<C-R><C-W>\>/

" navigation
nmap <LEADER>/ :History/<CR>
nmap <LEADER>; :History:<CR>
nmap <LEADER>a :A<CR>
nmap <LEADER>b :Buffer<CR>
nmap <LEADER>e :Lex<CR>
nmap <LEADER>i :BLines<CR>
nmap <LEADER>I :Lines<CR>
nmap <LEADER>t :Files<CR>
nmap <LEADER>v :Vex<CR>
nmap <LEADER>x :bd<CR>
nmap <LEADER><TAB> :b#<CR>

" specs
nmap <LEADER>rs :RspecFile<CR>
nmap <LEADER>rc :RspecFileCopy<CR>
nmap <LEADER>rl :RspecLine<CR>
nmap <LEADER>ry :RspecLineCopy<CR>

" search
nmap <LEADER>ff :FzfVimGrep<SPACE>
nmap <LEADER>fg :grep<SPACE>
nmap <LEADER>fr :History<CR>
nmap <LEADER>fw :FzfVimGrep<SPACE><C-R><C-W><CR>
nmap <LEADER>fW :FzfVimGrep<SPACE><C-R><C-A><CR>
nmap <LEADER>ga :Gwrite<CR>
nmap <LEADER>gc :Gcommit<CR>
nmap <LEADER>gb :Gblame<CR>
nmap <LEADER>gg :Ggrep<SPACE>
nmap <LEADER>gp :Gpush<CR>
nmap <LEADER>gs :GFiles?<CR>
nmap <LEADER>gt :GFiles<CR>
nmap <LEADER>gw :grep<SPACE><C-R><C-W><CR>

" Clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Store ctrl u and w store in the undo register
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

nmap Y y$

" Ctrl-K deletes to end of line
inoremap <C-K> <C-O>d$

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

cnoremap <expr> %%  getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'
