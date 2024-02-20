set clipboard^=unnamed " Share clipboard with os
set history=1000
set undodir=$HOME/.vim-undo
set undofile
set undolevels=1000
set undoreload=10000

if isdirectory($HOME . '/.vim-swap') == 0
  :silent !mkdir -p ~/.vim-swap >/dev/null 2>&1
endif

if isdirectory($HOME . '/.vim-undo') == 0
  :silent !mkdir -p ~/.vim-undo >/dev/null 2>&1
endif

xnoremap <silent> ae gg0oG$
onoremap <silent> ae :<c-u>execute "normal! m`"<bar>keepjumps normal! ggVG<cr>

nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
xnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
xnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'


nnoremap <silent> [<space> :<c-u>put! =repeat(nr2char(10), v:count1)<cr>
nnoremap <silent> ]<space> :<c-u>put =repeat(nr2char(10), v:count1)<cr>
nnoremap <silent> ]c <Cmd>lua require('vscode-neovim').call('workbench.action.editor.nextChange')<CR>
nnoremap <silent> [c <Cmd>lua require('vscode-neovim').call('workbench.action.editor.previousChange')<CR>

" Opposite of J
nnoremap K i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Q to replay q register in normal and visual
nnoremap Q @q
xnoremap Q :'<,'> :normal @q<cr>

" Y does Y not work like this by default
nnoremap Y y$

" Execute . on a visual range
xnoremap . :normal .<cr>

" Dont ever need to jump with '
nnoremap ' `
xnoremap ' `

nnoremap ; :
xnoremap ; :

nnoremap ,, <Cmd>lua require('vscode-neovim').call('editor.action.formatDocument')<CR>
nnoremap ,v :source $MYVIMRC<cr>

nnoremap <silent> <space>t <Cmd>lua require('vscode-neovim').call('workbench.action.quickOpen')<CR>
xnoremap <silent> <space><space> <Cmd>lua require('vscode-neovim').call('editor.action.startFindReplaceAction')<CR>


