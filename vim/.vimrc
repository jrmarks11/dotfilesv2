scriptencoding utf-8

call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'andrewradev/splitjoin.vim'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'janko-m/vim-test'
  Plug 'jgdavey/tslime.vim'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'rhysd/clever-f.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-rails'
  Plug 'w0rp/ale'
  Plug 'vimwiki/vimwiki'
call plug#end()

runtime macros/matchit.vim

let g:fzf_files_options =
      \ '--tac ' .
      \ '--preview-window top:60% ' .
      \ '--preview "(bat --color "always" {} || cat {}) 2> /dev/null | head -'
      \ . &lines . '"'

let g:tmux_navigator_no_mappings = 1

let g:gitgutter_map_keys = 0

let g:ale_fixers = {
      \   '*' : ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['prettier', 'eslint'],
      \   'javascript.jsx': ['prettier', 'eslint'],
      \   'typescript': ['prettier', 'eslint'],
      \   'typescriptreact': ['prettier', 'eslint'],
      \   'ruby': ['rubocop'],
      \   'python': ['black'],
      \   'html': ['prettier'],
      \   'eruby': ['erb-formatter', 'erblint']
      \ }
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'javascript.jsx': ['eslint'],
      \   'typescript': ['eslint'],
      \   'typescriptreact': ['eslint'],
      \   'ruby': ['rubocop'],
      \   'python': ['flake8'],
      \   'eruby': ['erblint']
      \ }

let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_ruby_rubocop_auto_correct_all = 1

let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

let g:test#preserve_screen = 1
let g:test#strategy = 'tslime'

let wiki_1 = {}
let wiki_1.path = '~/vimwiki/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'

let g:vimwiki_list = [wiki_1]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_map_prefix = ',w'

let g:rails_alternate_file_map = { 'app/models/': 'spec/models/', 'spec/models/': 'app/models/' }

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
