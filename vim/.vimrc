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
  Plug 'xtal8/traces.vim'

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

let g:ale_fixers = {
      \   'javascript': ['standard'],
      \   'bash': ['shellcheck'],
      \   'ruby': ['rubocop'],
      \ }
let g:ale_linters = {
      \   'javascript': ['standard'],
      \   'bash': ['shellcheck'],
      \   'ruby': ['rubocop'],
      \ }
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 'normal'

let g:alt_file_patterns =
      \ [
      \     [ 'spec\/lib\/\(.*\)_spec.rb', 'lib\/\1.rb' ],
      \     [ 'lib\/\(.*\).rb', 'spec\/lib\/\1_spec.rb' ],
      \     [ 'spec\/\(.*\)_spec.rb', 'app\/\1.rb' ],
      \     [ 'app\/\(.*\).rb', 'spec\/\1_spec.rb' ],
      \ ]

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

let g:textobj_line_no_default_key_mappings = 1
let g:tmux_navigator_no_mappings = 1
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

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

command! A call util#alt_file()
command! RspecFile call util#rspec_command('')
command! RspecLine call util#rspec_command(':' . line('.'))
command! SecondToLastBuffer call util#second_to_last()

let g:mapleader='s'
let g:splitjoin_join_mapping = 'sj'
let g:splitjoin_split_mapping = 'ss'
let g:switch_mapping = 'st'

nmap s <nop>
xmap s <nop>
   " sa is sandwich add
nmap sc :PlugClean<cr>
   " sd is sandwich delete
nmap sf <Plug>(ale_fix)
   " shp is gitgutter hunk preview
   " shs is gitgutter hunk stage
   " shu is gitgutter hunk undo
   " sj is splitjoin join
nmap sl <Plug>(EasyAlign)
xmap sl <Plug>(EasyAlign)
nmap so <Plug>(ale_toggle_buffer)
   " sr is sandwich replace
   " ss is splitjoin split
   " st is switch
nmap su :PlugUpdate<cr>

nnoremap <space><space> :'{,'}s/\<<c-r><c-w>\>//g<left><left>
xnoremap <space><space> y:'{,'}s/<c-r><c-0>//g<left><left>
nnoremap <space><tab> :b#<cr>
nnoremap <space>a :A<cr>
nnoremap <space>b :Buffer!<cr>
nnoremap <space>c :GFiles?<cr>
nnoremap <space>d d
nnoremap <space>e :History!<cr>
nnoremap <space>f :Rg!<space><c-r><c-w><cr>
xnoremap <space>f y:Rg!<space><c-r>0<cr>
nnoremap <space>g :grep<space><c-r><c-w><cr>
xnoremap <space>g y:grep<space>"<c-r>0"<cr>
nnoremap <space>h :help<space><c-r><c-w><cr>
nnoremap <space>i :BLines!<cr>
nnoremap <space>j :Rg!<space>
nnoremap <space>k k
nnoremap <space>l :lgrep<space><c-r><c-w><cr>
xnoremap <space>l y:lgrep<space>"<c-r>0"<cr>
nnoremap <space>m m
nnoremap <space>n :BranchFiles!<cr>
nnoremap <space>o Obinding.pry<esc>
nnoremap <space>p :set paste<cr>]p:set nopaste<cr>
nnoremap <space>q q
nnoremap <space>r :RspecLine<cr>
nnoremap <space>s :%s/\<<c-r><c-w>\>//g<left><left>
xnoremap <space>s y:%s/<c-r><c-0>//g<left><left>
nnoremap <space>t :Files!<cr>
nnoremap <space>u :RspecFile<cr>
nnoremap <space>v :source $MYVIMRC<cr>
nnoremap <space>w :g/^\W*\<binding.pry\>$/d<cr>
nnoremap <space>x x
nnoremap <space>y :Helptags<cr>
nnoremap <space>z z

omap ad <Plug>(textobj-line-a)
vmap ad <Plug>(textobj-line-a)
omap id <Plug>(textobj-line-i)
vmap id <Plug>(textobj-line-i)

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

inoremap <silent> ;f <c-x><c-f>
inoremap <silent> ;i <c-x><c-i>
inoremap <silent> ;l <c-x><c-l>
inoremap <silent> ;n <c-x><c-n>
inoremap <silent> ;o <c-x><c-o>
inoremap <silent> ;; <c-x><c-p>
inoremap <silent> ;t <c-x><c-]>
inoremap <silent> ;u <c-x><c-u>

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
