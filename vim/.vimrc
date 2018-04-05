scriptencoding utf-8

call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'andrewradev/splitjoin.vim'
  Plug 'andrewradev/switch.vim'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'elixir-editors/vim-elixir'
  Plug 'jgdavey/tslime.vim'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'machakann/vim-sandwich'
  Plug 'nelstrom/vim-visual-star-search'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'SirVer/ultisnips'
  Plug 'tmux-plugins/vim-tmux'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'w0rp/ale'

  Plug 'adriaanzon/vim-textobj-matchit'
  Plug 'b4winckler/vim-angry'
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-line'
  Plug 'kana/vim-textobj-user'
  Plug 'wellle/targets.vim'
call plug#end()
runtime macros/matchit.vim

set autoindent
set autoread
set background=light
set backspace=indent,eol,start
set clipboard^=unnamed
set colorcolumn=80
set complete-=i
set complete-=t
set cursorline
set directory=~/.vim-swap//
set display+=lastline
set esckeys
set expandtab
set formatoptions+=j
set grepformat=%f:%l:%c:%m
set grepprg=rg\ --no-heading\ --vimgrep\ --smart-case\ --hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:▸\ ,trail:·,nbsp:␣
set nrformats-=octal
set number
set relativenumber
set scrolljump=8
set scrolloff=1
set shiftround
set shiftwidth=2
set showcmd
set showmatch
set sidescrolloff=5
set smartcase
set smarttab
set splitbelow
set splitright
set statusline=\ %f%=\%c
set tabstop=2
set undodir=$HOME/.vim-undo
set undofile
set undolevels=1000
set undoreload=10000
set updatetime=100
set visualbell
set wildmenu
set wildmode=longest,list
colorscheme PaperColor
highlight LineNr guifg=#cccccc

if isdirectory($HOME . '/.vim-swap') == 0
  :silent !mkdir -p ~/.vim-swap >/dev/null 2>&1
endif

if isdirectory($HOME . '/.vim-undo') == 0
  :silent !mkdir -p ~/.vim-undo >/dev/null 2>&1
endif

if !empty(&viminfo)
  set viminfo^=!
endif

let g:alt_file_patterns =
      \ [
      \     [ 'spec\/lib\/\(.*\)_spec.rb', 'lib\/\1.rb' ],
      \     [ 'lib\/\(.*\).rb', 'spec\/lib\/\1_spec.rb' ],
      \     [ 'spec\/\(.*\)_spec.rb', 'app\/\1.rb' ],
      \     [ 'app\/\(.*\).rb', 'spec\/\1_spec.rb' ],
      \     [ 'test\/\(.*\)_test.exs', 'lib\/\1.ex' ],
      \     [ 'lib\/\(.*\).ex', 'test\/\1_test.exs' ],
      \ ]
command! A call util#alt_file()
command! LastBuffer call util#last_buffer(1)
command! SecondToLastBuffer call util#last_buffer(2)

nmap s <nop>
xmap s <nop>
let g:mapleader='s'

nnoremap <space><space> :'{,'}s/\<<c-r><c-w>\>//g<left><left>
xnoremap <space><space> y:'{,'}s/<c-r><c-0>//g<left><left>
nnoremap <space><tab> :LastBuffer<cr>
nnoremap <space>a :A<cr>
nnoremap <space>d :set relativenumber!<cr>
nnoremap <space>g g
nnoremap <space>h :help<space><c-r><c-w><cr>
nnoremap <space>k k
nnoremap <space>l l
nnoremap <space>m m
nnoremap <space>p :set paste<cr>o<esc>]p:set nopaste<cr>{dd
nnoremap <space>q q
nnoremap <space>s :%s/\<<c-r><c-w>\>//g<left><left>
xnoremap <space>s y:%s/<c-r><c-0>//g<left><left>
nnoremap <space>v :source $MYVIMRC<cr>
nnoremap <space>x x
nnoremap <space>z z

nnoremap & :&&<CR>
xnoremap & :&&<CR>
nnoremap ' `
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
nnoremap Q @q
xnoremap Q :'<,'> :normal @q<cr>
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w
nnoremap Y y$
nnoremap \ :SecondToLastBuffer<cr>
xnoremap . :normal .<cr>

nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
nnoremap ]a :next<cr>
nnoremap [a :previous<cr>
nnoremap [e :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e :<c-u>execute 'move +'. v:count1<cr>
nnoremap ]l :lnext<cr>
nnoremap [l :lprevious<cr>
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>
nnoremap ]t :tnext<cr>
nnoremap [t :tprevious<cr>

nnoremap <c-j> <c-w>
nnoremap <c-j>x <c-w>q
nnoremap <c-l> :nohlsearch<c-r>=has('diff')?'<Bar>diffupdate':''<cr><cr><c-l>

inoremap <silent> ;f <c-x><c-f>
inoremap <silent> ;i <c-x><c-i>
inoremap <silent> ;l <c-x><c-l>
inoremap <silent> ;n <c-x><c-n>
inoremap <silent> ;o <c-x><c-o>
inoremap <silent> ;; <c-x><c-p>
inoremap <silent> ;t <c-x><c-]>
inoremap <silent> ;u <c-x><c-u>

cnoremap <expr> %% getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'
cnoremap <expr> .. getcmdtype() == ':' ? fnameescape(expand('%')) : '..'
cnoremap <c-n> <down>
cnoremap <c-p> <up>

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

augroup Formatting
  autocmd!
  autocmd BufWritePre * : %s/\s\+$//e
  autocmd FileType elixir,ruby
        \ autocmd BufWritePre * : %s/	/  /ge
  autocmd FileType elixir,ruby
        \ autocmd BufWritePre * : %s/\n\n\n\+//e
augroup END
