scriptencoding utf-8

call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'andrewradev/sideways.vim'
  Plug 'andrewradev/splitjoin.vim'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'jgdavey/tslime.vim'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'machakann/vim-sandwich'
  Plug 'nelstrom/vim-visual-star-search'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'rhysd/clever-f.vim'
  Plug 'romainl/vim-qf'
  Plug 'SirVer/ultisnips'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-commentary'
  Plug 'w0rp/ale'

  " Text Objects
  Plug 'adriaanzon/vim-textobj-matchit'
  Plug 'Julian/vim-textobj-variable-segment'
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-user'
call plug#end()

runtime macros/matchit.vim

let g:ale_fixers = {
      \   'bash': ['shellcheck'],
      \   'elixir': ['mix_format'],
      \   'javascript': ['standard'],
      \   'ruby': ['rubocop'],
      \ }
let g:ale_linters = {
      \   'bash': ['shellcheck'],
      \   'elixir': ['credo'],
      \   'javascript': ['standard'],
      \   'ruby': ['rubocop'],
      \ }
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 'normal'

let g:clever_f_across_no_line = 1

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
      \ '--preview "(rougify {} -t igorpro || coderay {} || cat {}) 2> /dev/null | head -'
      \ . &lines . '"'

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

let g:splitjoin_join_mapping = 'sj'
let g:splitjoin_split_mapping = 'ss'

let g:tmux_navigator_no_mappings = 1

let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsSnippetDirectories=['Snips']

" List of regex checked for alternate files first maps to second
let g:alt_file_patterns =
      \ [
      \   [ 'spec\/lib\/\(.*\)_spec.rb', 'lib\/\1.rb' ],
      \   [ 'lib\/\(.*\).rb', 'spec\/lib\/\1_spec.rb' ],
      \   [ 'spec\/\(.*\)_spec.rb', 'app\/\1.rb' ],
      \   [ 'app\/\(.*\).rb', 'spec\/\1_spec.rb' ],
      \   [ 'test\/\(.*\)_test.exs', 'lib\/\1.ex' ],
      \   [ 'lib\/\(.*\).ex', 'test\/\1_test.exs' ],
      \   [ '.*\/.bash-files.*sh', '~\/.bashrc' ],
      \ ]

set autoindent
set autoread
set background=light
set backspace=indent,eol,start
set clipboard^=unnamed " Share clipboard with os
set colorcolumn=80
set complete-=i
set complete-=t
set cursorline
set directory=~/.vim-swap//
set display+=lastline
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

if !empty(&viminfo)
  set viminfo^=!
endif

if isdirectory($HOME . '/.vim-swap') == 0
  :silent !mkdir -p ~/.vim-swap >/dev/null 2>&1
endif

if isdirectory($HOME . '/.vim-undo') == 0
  :silent !mkdir -p ~/.vim-undo >/dev/null 2>&1
endif

colorscheme PaperColor
highlight LineNr guifg=#cccccc
