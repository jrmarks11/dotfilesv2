set clipboard^=unnamed " Share clipboard with os
set ignorecase
set smartcase

call plug#begin('~/.vim/plugged')
  Plug 'andrewradev/splitjoin.vim'
  Plug 'rhysd/clever-f.vim'
  Plug 'tpope/vim-surround'
call plug#end()

xnoremap <silent> ae gg0oG$
onoremap <silent> ae :<c-u>execute "normal! m`"<bar>keepjumps normal! ggVG<cr>

nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
xnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
xnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

nmap s <nop>
nmap ss :SplitjoinSplit<cr>
nmap sj :SplitjoinJoin<cr>

nnoremap <silent> [<space> :<c-u>put! =repeat(nr2char(10), v:count1)<cr>
nnoremap <silent> ]<space> :<c-u>put =repeat(nr2char(10), v:count1)<cr>
nnoremap <silent> ]c <Cmd>lua require('vscode-neovim').call('workbench.action.editor.nextChange')<CR>
nnoremap <silent> [c <Cmd>lua require('vscode-neovim').call('workbench.action.editor.previousChange')<CR>

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
xnoremap ,, <Cmd>lua require('vscode-neovim').call('editor.action.formatSelection')<CR>
nnoremap ,v :source $MYVIMRC<cr>

nnoremap <silent> <space>t <Cmd>lua require('vscode-neovim').call('workbench.action.quickOpen')<CR>
xnoremap <silent> <space><space> <Cmd>lua require('vscode-neovim').call('editor.action.startFindReplaceAction')<CR>
nnoremap <silent> <space>r <Cmd>lua require('vscode-neovim').call('workbench.action.showAllEditorsByMostRecentlyUsed')<CR>
nnoremap <silent> <space>d <Cmd>lua require('vscode-neovim').call('workbench.files.action.showActiveFileInExplorer')<CR>

function! VistarSearch(cmdtype)
  let temp = @s
  normal! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype . '\\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

xnoremap * :<C-u>call VistarSearch('/')<CR>/<C-r>=@/<CR><CR>
xnoremap # :<C-u>call VistarSearch('?')<CR>?<C-r>=@/<CR><CR>

function! NoPastePaste()
  set paste
  normal! o
  normal! ]p
  set nopaste
endfunction

nnoremap <space>p :<C-u>call NoPastePaste()<CR><CR>

augroup markdown_enter
    autocmd!
    autocmd FileType markdown nnoremap <buffer> <CR> <Plug>NetrwBrowseX
augroup END
