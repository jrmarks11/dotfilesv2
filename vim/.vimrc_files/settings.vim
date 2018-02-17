scriptencoding utf-8

set autoindent
set autoread
set background=light
set backspace=indent,eol,start
set clipboard=unnamed
set colorcolumn=80
set complete-=i
set cursorline
set directory=~/.vim-swap//
set display+=lastline
set expandtab
set formatoptions+=j
set grepformat=%f:%l:%c:%m
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:▸\ ,trail:·,nbsp:␣
set noerrorbells
set nrformats-=octal
set number
set omnifunc=syntaxcomplete#Complete
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
set statusline=\ %f%=\%c\ -\ %{ALEGetStatusLine()}
set tabstop=2
set undodir=$HOME/.vim-undo
set undofile
set undolevels=1000
set undoreload=10000
set visualbell
set wildmenu
set wildmode=longest,list

if isdirectory($HOME . '/.vim-swap') == 0
  :silent !mkdir -p ~/.vim-swap >/dev/null 2>&1
endif

if isdirectory($HOME . '/.vim-undo') == 0
  :silent !mkdir -p ~/.vim-undo >/dev/null 2>&1
endif

if executable('rg')
  set grepprg=rg\ --no-heading\ --vimgrep\ --smart-case
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

if !empty(&viminfo)
  set viminfo^=!
endif

colorscheme PaperColor
highlight LineNr guifg=#cccccc
