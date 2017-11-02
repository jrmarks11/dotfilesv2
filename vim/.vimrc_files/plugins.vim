call plug#begin('~/.vim/plugged')
" colors
  Plug 'crusoexia/vim-dracula'
  Plug 'NLKNguyen/papercolor-theme'

" text-objects
  Plug 'b4winckler/vim-angry'
  Plug 'julian/vim-textobj-variable-segment'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-user'

"plugins
  Plug 'andrewradev/splitjoin.vim'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'https://github.com/ludovicchabant/vim-gutentags.git'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-rsi'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'

" language
  Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
call plug#end()
