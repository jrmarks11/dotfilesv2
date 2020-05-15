scriptencoding utf-8

call plug#begin('~/.vim/plugged')
  Plug 'axvr/org.vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'rhysd/clever-f.vim'
call plug#end()

runtime macros/matchit.vim

let g:fzf_files_options =
      \ '--reverse ' .
      \ '--preview-window top:60% ' .
      \ '--preview "(bat --color "always" {} || cat {}) 2> /dev/null | head -'
      \ . &lines . '"'

let g:tmux_navigator_no_mappings = 1

set autoindent
set autoread
set background=light
set backspace=indent,eol,start
set clipboard^=unnamed " Share clipboard with os
set colorcolumn=80
set complete-=i
set cursorline
set directory=~/.vim-swap//
set display+=lastline
set expandtab
set formatoptions+=j
set grepprg=rg\ --vimgrep\ --no-heading\ --hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:▸\ ,trail:·,nbsp:␣
set nrformats-=octal
set number
set nojoinspaces
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
set textwidth=78
set undodir=$HOME/.vim-undo
set undofile
set undolevels=1000
set undoreload=10000
set updatetime=100
set visualbell
set wildmenu
set wildmode=longest,list

if isdirectory($HOME . '/.vim-swap') == 0
  :silent !mkdir -p ~/.vim-swap >/dev/null 2>&1
endif

if isdirectory($HOME . '/.vim-undo') == 0
  :silent !mkdir -p ~/.vim-undo >/dev/null 2>&1
endif

colorscheme PaperColor
highlight LineNr guifg=#cccccc
