scriptencoding utf-8

call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'andrewradev/splitjoin.vim'
  Plug 'andrewradev/switch.vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'davidoc/taskpaper.vim'
  Plug 'jgdavey/tslime.vim'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'machakann/vim-sandwich'
  Plug 'nelstrom/vim-visual-star-search'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-rails'
  Plug 'w0rp/ale'

" text-objects
  Plug 'adriaanzon/vim-textobj-matchit'
  Plug 'b4winckler/vim-angry'
  Plug 'julian/vim-textobj-variable-segment'
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-line'
  Plug 'kana/vim-textobj-user'
call plug#end()

runtime macros/matchit.vim
