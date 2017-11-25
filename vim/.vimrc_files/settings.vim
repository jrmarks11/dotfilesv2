scriptencoding utf-8

if exists('g:loaded_jm_settings')
  finish
else
  let g:loaded_jm_settings = 1
endif

set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set clipboard=unnamed
set colorcolumn=80
set complete-=i
set cursorline
set display+=lastline
set expandtab
set formatoptions+=j " Delete comment character when joining commented lines
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set list
set listchars=tab:▸\ ,trail:·,nbsp:␣
set noerrorbells
set nrformats-=octal
set number
set scrolloff=1
set sessionoptions-=options
set shiftround
set shiftwidth=2
set showmatch
set sidescrolloff=5
set smartcase
set smarttab
set splitbelow
set splitright
set tabstop=2
set ttimeout
set ttimeoutlen=100
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
set directory=~/.vim-swap//

if isdirectory($HOME . '/.vim-undo') == 0
  :silent !mkdir -p ~/.vim-undo >/dev/null 2>&1
endif

if executable('rg')
  set grepprg=rg\ --no-heading\ --vimgrep\ --smart-case
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
set grepformat=%f:%l:%c:%m

if !empty(&viminfo)
  set viminfo^=!
endif

let g:airline#extensions#whitespace#enabled = 0
let g:airline_mode_map = { 'n':'N', 'i':'I', 'v':'V' }
let g:airline_powerline_fonts = 1
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%c'
let g:airline_skip_empty_sections = 1
let g:airline_theme='tomorrow'
let g:clever_f_across_no_line = 1
let g:clever_f_mark_cursor_color = 'IncSearch'
let g:clever_f_timeout_ms = 3000
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0
let g:gutentags_ctags_tagfile = '.tags'
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = 20
