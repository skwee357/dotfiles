syntax on

set nocompatible
set number
set relativenumber
set incsearch
set nohlsearch
set tabstop=4 softtabstop=4
set noerrorbells
set smartindent
set scrolloff=8

call plug#begin()
" Plug 'arcticicestudio/nord-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
call plug#end()

colorscheme gruvbox
set background=dark
let g:airline_theme='tomorrow'
