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
set undodir=~/.vim/undodir
set undofile

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-y> :Buffers<CR>

call plug#begin()
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
Plug '/opt/homebrew/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

colorscheme gruvbox
set background=dark
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }

" change cursor to line in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

