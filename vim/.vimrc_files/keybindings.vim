scriptencoding utf-8

" experimental
inoremap ,, <C-p><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>
inoremap ,/ <C-x><C-f><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>
inoremap ,. <C-x><C-l><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>
nmap <SPACE>, :!echo ,<CR>
nmap <SPACE>h :DemoteFromLet<CR>
vmap <SPACE>h :call DemoteFromLet()<CR>
nmap <SPACE>j ]e
nmap <SPACE>k [e
nmap <SPACE>l :PromoteToLet<CR>
vmap <SPACE>l :call PromoteToLet()<CR>
nmap <SPACE>n }jzt
nmap <SPACE>N 2{jzt
nmap <SPACE>m }jzz
nmap <SPACE>M 2{jzz
nmap <SPACE>o :!echo o<CR>
nmap <SPACE>q :!echo q<CR>
nmap <SPACE>s :!echo s<CR>
nmap <SPACE>w :!echo w<CR>

" almost ok
nmap <SPACE>. @@
nmap <SPACE>d "_d
nmap <SPACE>p "0p
nmap <SPACE>z ZZ<CR>
nnoremap K i
nnoremap Q @q
xnoremap Q :'<,'> :normal @q<CR>
xnoremap . :norm.<CR>
nnoremap c* *Ncgn
nnoremap c# #NcgN

" git
nmap <SPACE>c :GitGutterLineHighlightsToggle<CR>
nmap <SPACE>ga :Gwrite<CR>
nmap <SPACE>gb :Gblame<CR>
nmap <SPACE>gc :Gcommit<CR>
nmap <SPACE>gd :Gdiff<CR>
nmap <SPACE>gg :Ggrep<SPACE>
nmap <SPACE>gh :Gbrowse!<CR>
vmap <SPACE>gh :Gbrowse!<CR>
nmap <SPACE>gp :Gpush<CR>
nmap <SPACE>gs :GFiles?<CR>
nmap <SPACE>gt :GFiles<CR>

" navigation
cnoremap <expr> %%  getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'
nmap <SPACE>/ :History/<CR>
nmap <SPACE>; :History:<CR>
nmap <SPACE>a :A<CR>
nmap <SPACE>b :Buffer<CR>
nmap <SPACE>e :Lex<CR>
nmap <SPACE>E :Vex<CR>
nmap <SPACE>i :BLines<CR>
nmap <SPACE>I :Lines<CR>
nmap <SPACE>t :Files<CR>
nmap <SPACE>x :bd<CR>
nmap <SPACE>y :Helptags<CR>
nmap <SPACE><TAB> :b#<CR>

" plugins
nmap <SPACE>u :PlugUpdate<CR>
nmap <SPACE>U :PlugClean<CR>

" specs
nmap <SPACE>rs :RspecFile<CR>
nmap <SPACE>rc :RspecFileCopy<CR>
nmap <SPACE>rl :RspecLine<CR>
nmap <SPACE>ry :RspecLineCopy<CR>

" search
nnoremap <SPACE><SPACE> :'{,'}s/\<<C-R><C-W>\>/
nnoremap <SPACE>% :%s/\<<C-R><C-W>\>/
nmap <SPACE>ff :FzfVimGrep<SPACE>
nmap <SPACE>fg :grep<SPACE>
nmap <SPACE>fr :History<CR>
nmap <SPACE>fw :FzfVimGrep<SPACE><C-R><C-W><CR>
nmap <SPACE>fW :FzfVimGrep<SPACE><C-R><C-A><CR>
nmap <SPACE>fy :help<SPACE><C-R><C-W><CR>
nmap <SPACE>fY :helpg<SPACE><C-R><C-W><CR>
nmap <SPACE>gw :grep<SPACE><C-R><C-W><CR>

" tmux
nnoremap <C-J> <C-W>
nnoremap <C-J>x <C-W>q
nnoremap <silent> <C-J>h :TmuxNavigateLeft<CR>
nnoremap <silent> <C-J>j :TmuxNavigateDown<CR>
nnoremap <silent> <C-J>k :TmuxNavigateUp<CR>
nnoremap <silent> <C-J>l :TmuxNavigateRight<CR>
nnoremap <silent> <C-J>b :TmuxNavigatePrevious<CR>

" Clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Store ctrl u and w store in the undo register
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

inoremap <C-K> <C-O>d$
nmap Y y$
nmap <SPACE>v :source $MYVIMRC<CR>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
