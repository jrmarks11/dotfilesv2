scriptencoding utf-8

call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'andrewradev/splitjoin.vim'
  Plug 'andrewradev/switch.vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'jgdavey/tslime.vim'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'machakann/vim-sandwich'
  Plug 'nelstrom/vim-visual-star-search'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'tmux-plugins/vim-tmux'
  Plug 'tpope/vim-commentary'
  Plug 'w0rp/ale'

  Plug 'adriaanzon/vim-textobj-matchit'
  Plug 'b4winckler/vim-angry'
  Plug 'julian/vim-textobj-variable-segment'
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-line'
  Plug 'kana/vim-textobj-user'
call plug#end()
runtime macros/matchit.vim

set background=light
set colorcolumn=80
set cursorline
set display+=lastline
set laststatus=2
set number
set scrolljump=8
set scrolloff=1
set sidescrolloff=5
set showcmd
set showmatch
set splitbelow
set splitright
set statusline=\ %f%=\%c
colorscheme PaperColor
highlight LineNr guifg=#cccccc

set autoindent
set backspace=indent,eol,start
set expandtab
set formatoptions+=j
set list
set listchars=tab:▸\ ,trail:·,nbsp:␣
set shiftwidth=2
set smarttab
set tabstop=2
set shiftround

set hlsearch
set grepformat=%f:%l:%c:%m
if executable('rg')
  set grepprg=rg\ --no-heading\ --vimgrep\ --smart-case\ --hidden
endif
set ignorecase
set incsearch
set smartcase

set undodir=$HOME/.vim-undo
set undofile
set undolevels=1000
set undoreload=10000
if isdirectory($HOME . '/.vim-undo') == 0
  :silent !mkdir -p ~/.vim-undo >/dev/null 2>&1
endif

set directory=~/.vim-swap//
if isdirectory($HOME . '/.vim-swap') == 0
  :silent !mkdir -p ~/.vim-swap >/dev/null 2>&1
endif

if !empty(&viminfo)
  set viminfo^=!
endif

set autoread
set clipboard^=unnamed
set complete-=i
set esckeys
set history=1000
set nrformats-=octal
set updatetime=100
set visualbell
set wildmenu
set wildmode=longest,list

let g:ale_linters = {
      \   'javascript': ['standard'],
      \   'bash': ['shellcheck'],
      \   'ruby': ['rubocop'],
      \ }
let g:ale_fixers = {
      \   'javascript': ['standard'],
      \   'bash': ['shellcheck'],
      \   'ruby': ['rubocop'],
      \ }
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \   'bg':      ['bg', 'Normal'],
      \   'hl':      ['fg', 'Comment'],
      \   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \   'hl+':     ['fg', 'Statement'],
      \   'info':    ['fg', 'PreProc'],
      \   'border':  ['fg', 'Ignore'],
      \   'prompt':  ['fg', 'Conditional'],
      \   'pointer': ['fg', 'Exception'],
      \   'marker':  ['fg', 'Keyword'],
      \   'spinner': ['fg', 'Label'],
      \   'header':  ['fg', 'Comment'] }
let g:fzf_files_options =
      \ '--reverse ' .
      \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -' . &lines . '"'

let s:fzf_grep_cmd =
      \ 'rg --column --line-number --no-heading --fixed-strings --ignore-case'
      \ . " --hidden --follow --glob '!.git/*' --color 'always' "
let s:fzf_options =
      \ '--reverse '.
      \ '--preview "(git diff --color=always master -- {} | tail -n +5 || cat {})'
      \ . '2> /dev/null | head -' . &lines . '"'
let s:source = '(git diff --name-only HEAD $(git merge-base HEAD master))|sort|uniq'
let s:bf_opts = { 'source': s:source, 'sink': 'e', 'options': s:fzf_options }

command! -bang BranchFiles
      \ call fzf#run(fzf#wrap('BranchFiles', s:bf_opts, <bang>0))
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(s:fzf_grep_cmd .shellescape(<q-args>), 1,
      \ fzf#vim#with_preview('right:50%'), <bang>0)

let g:gutentags_ctags_tagfile = '.tags'

let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
      \ {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1,
      \  'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
      \ {'buns': ['{\s*', '\s*}'], 'nesting': 1, 'regex': 1, 'match_syntax': 1,
      \  'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'],
      \  'input': ['{']},
      \ {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1,
      \  'kind': ['add', 'replace'], 'action': ['add'], 'input': [')']},
      \ {'buns': ['(\s*', '\s*)'], 'nesting': 1, 'regex': 1, 'match_syntax': 1,
      \  'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'],
      \  'input': [')']},
      \ ]

let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
let g:tmux_navigator_no_mappings = 1

let g:alt_file_patterns =
      \ [
      \     [ 'spec\/lib\/\(.*\)_spec.rb', 'lib\/\1.rb' ],
      \     [ 'lib\/\(.*\).rb', 'spec\/lib\/\1_spec.rb' ],
      \     [ 'spec\/\(.*\)_spec.rb', 'app\/\1.rb' ],
      \     [ 'app\/\(.*\).rb', 'spec\/\1_spec.rb' ],
      \ ]

command! A call util#alt_file()
command! RspecFile call util#rspec_command('')
command! RspecLine call util#rspec_command(':' . line('.'))
command! SecondToLastBuffer call util#second_to_last()

let mapleader='s'
nmap s <nop>
xmap s <nop>
nmap sl <Plug>(EasyAlign)
xmap sl <Plug>(EasyAlign)
let g:splitjoin_split_mapping = 'ss'
let g:splitjoin_join_mapping = 'sj'
let g:switch_mapping = 'st'

nnoremap <space><space> :'{,'}s/\<<c-r><c-w>\>//g<left><left>
xnoremap <space><space> y:'{,'}s/<c-r><c-0>//g<left><left>
nnoremap <space><tab> :b#<cr>
nnoremap <space>a :A<cr>
nnoremap <space>b :Buffer!<cr>
nnoremap <space>c :GFiles?<cr>
nnoremap <space>d Obinding.pry<esc>
nnoremap <space>e :History!<cr>
nnoremap <space>f :Rg!<space><c-r><c-w><cr>
xnoremap <space>f y:Rg!<space><c-r>0<cr>
nnoremap <space>g :grep<space><c-r><c-w><cr>
xnoremap <space>g y:grep<space>"<c-r>0"<cr>
nnoremap <space>h :help<space><c-r><c-w><cr>
nnoremap <space>i :BLines!<cr>
nnoremap <space>j :Rg!<space>
nnoremap <space>k :RspecFile<cr>
nnoremap <space>l :ALEFix<cr>
nnoremap <space>m :ALEToggle<cr>
nnoremap <space>n :BranchFiles!<cr>
nnoremap <space>o o
nnoremap <space>p :set paste<cr>]p:set nopaste<cr>
nnoremap <space>q q
nnoremap <space>r :RspecLine<cr>
nnoremap <space>s :%s/\<<c-r><c-w>\>//g<left><left>
xnoremap <space>s y:%s/<c-r><c-0>//g<left><left>
nnoremap <space>t :Files!<cr>
nnoremap <space>u :PlugUpdate<cr>
nnoremap <space>v :source $MYVIMRC<cr>
nnoremap <space>w w
nnoremap <space>x :PlugClean<cr>
nnoremap <space>y :g/^\W*\<binding.pry\>$/d<cr>
nnoremap <space>z :Helptags<cr>

nnoremap & :&&<CR>
xnoremap & :&&<CR>
nnoremap ' `
nnoremap Q @q
xnoremap Q :'<,'> :normal @q<cr>
nnoremap Y y$
nnoremap \ :SecondToLastBuffer<cr>
xnoremap . :normal .<cr>

nnoremap [<space> O<esc>j
nnoremap ]<space> o<esc>k
nnoremap ]a :next<cr>
nnoremap [a :previous<cr>
nnoremap ]l :lnext<cr>
nnoremap [l :lprevious<cr>
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>
nnoremap ]t :tnext<cr>
nnoremap [t :tprevious<cr>

nnoremap <c-j> <c-w>
nnoremap <c-j>x <c-w>q
nnoremap <silent><c-j>h :TmuxNavigateLeft<cr>
nnoremap <silent><c-j>j :TmuxNavigateDown<cr>
nnoremap <silent><c-j>k :TmuxNavigateUp<cr>
nnoremap <silent><c-j>l :TmuxNavigateRight<cr>
nnoremap <silent><c-j>b :TmuxNavigatePrevious<cr>
nnoremap <c-l> :nohlsearch<c-r>=has('diff')?'<Bar>diffupdate':''<cr><cr><c-l>

inoremap ;; <c-x><c-l>
inoremap ,, <c-x><c-p>
inoremap <c-f> <c-x><c-f>
inoremap <c-l> <c-x><c-l>

cnoremap <expr> %%  getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'

augroup AutoResize
  autocmd!
  autocmd VimResized * wincmd =
augroup END

augroup AutoSaveAndRead
  autocmd!
  autocmd InsertLeave,TextChanged * silent! wall
  autocmd CursorHold              * silent! checktime
augroup END

augroup CursorLine
  autocmd!
  autocmd WinEnter,InsertLeave * set cursorline
  autocmd WinLeave,InsertEnter * set nocursorline
augroup END

augroup LastCursor
  autocmd!
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe 'normal g`"' |
        \ endif
augroup END

augroup RemoveTrailingWhitespace
  autocmd!
  autocmd BufWritePre * : %s/\s\+$//e
augroup END
