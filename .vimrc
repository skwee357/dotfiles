syntax on

set nocompatible
set number
set relativenumber
set incsearch
set nohlsearch
set tabstop=2 softtabstop=2
set noerrorbells
set smartindent
set scrolloff=8
set laststatus=2
set noshowmode

call plug#begin()
" Plug 'arcticicestudio/nord-vim'
Plug 'gruvbox-community/gruvbox'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'
call plug#end()

colorscheme gruvbox
set background=dark
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }
