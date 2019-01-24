scriptencoding utf-8

call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'andrewradev/sideways.vim'
  Plug 'andrewradev/splitjoin.vim'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'janko-m/vim-test'
  Plug 'jgdavey/tslime.vim'
  Plug 'justinmk/vim-sneak'
  Plug 'justinmk/vim-dirvish'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'machakann/vim-sandwich'
  Plug 'mattn/emmet-vim'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'pbogut/fzf-mru.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-commentary'
  Plug 'w0rp/ale'
call plug#end()

runtime macros/matchit.vim
runtime macros/sandwich/keymap/surround.vim

let g:ale_fixers = {
      \   'elixir': ['mix_format'],
      \   'javascript': ['eslint'],
      \   'php': ['php_cs_fixer'],
      \   'ruby': ['rubocop'],
      \   'vue': ['eslint'],
      \ }
let g:ale_linters = {
      \   'zsh': ['shellcheck'],
      \   'elixir': ['credo'],
      \   'javascript': ['eslint'],
      \   'ruby': ['rubocop'],
      \   'vue': ['eslint'],
      \ }
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 'normal'

let g:fzf_files_options =
      \ '--reverse ' .
      \ '--preview-window top:60% ' .
      \ '--preview "(bat --color "always" {} || cat {}) 2> /dev/null | head -'
      \ . &lines . '"'

let g:fzf_mru_relative = 1

let g:gitgutter_map_keys = 0

let g:gutentags_ctags_tagfile = '.tags'

let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
      \ {'buns': ['`', '`'], 'quoteescape': 1, 'expand_range': 0, 'nesting': 0,
      \  'linewise': 0, 'match_syntax': 1},
      \ {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1,
      \  'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
      \ {'buns': ['{\s*', '\s*}'], 'nesting': 1, 'regex': 1, 'match_syntax': 1,
      \  'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'],
      \  'input': ['{']},
      \ ]

let g:sneak#label = 1
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1

let g:test#preserve_screen = 1
let g:test#strategy = 'tslime'

let g:tmux_navigator_no_mappings = 1

let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsSnippetDirectories=['Snips']

let g:user_emmet_mode='i'

" List of regex checked for alternate files first maps to second
let g:alt_file_patterns =
      \ [
      \   [ 'spec\/lib\/\(.*\)_spec.rb', 'lib\/\1.rb' ],
      \   [ 'lib\/\(.*\).rb', 'spec\/lib\/\1_spec.rb' ],
      \   [ 'spec\/\(.*\)_spec.rb', 'app\/\1.rb' ],
      \   [ 'app\/\(.*\).rb', 'spec\/\1_spec.rb' ],
      \   [ 'test\/\(.*\)_test.exs', 'lib\/\1.ex' ],
      \   [ 'lib\/\(.*\).ex', 'test\/\1_test.exs' ],
      \   [ '\(.*\).unit.test.js', '\1.vue' ],
      \   [ '\(.*\).vue', '\1.unit.test.js' ],
      \   [ '.*\/\.zsh-files\/.*', '~/.zshrc']
      \ ]

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
