call plug#begin('~/.vim/plugged')
" language
  Plug 'elixir-lang/vim-elixir'
  Plug 'jceb/vim-orgmode', { 'for': 'org' }
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-speeddating', { 'for': 'org' }

" plugins
  Plug 'airblade/vim-gitgutter'
  Plug 'andrewradev/splitjoin.vim'
  Plug 'jgdavey/tslime.vim'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'rhysd/clever-f.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-rsi'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'w0rp/ale'

" text-objects
  Plug 'adriaanzon/vim-textobj-matchit'
  Plug 'b4winckler/vim-angry'
  Plug 'julian/vim-textobj-variable-segment'
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-user'
call plug#end()

runtime macros/matchit.vim
