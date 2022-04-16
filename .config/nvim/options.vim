set nocompatible
set encoding=UTF-8
set number
set relativenumber
set incsearch
set nohlsearch
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set noerrorbells
set scrolloff=8
set laststatus=2
set noshowmode
set undodir=~/.local/share/nvim/undodir
set undofile
set nobackup
set nowritebackup
set noswapfile
set signcolumn=yes
set termguicolors
set cmdheight=1
set hidden
set clipboard=unnamedplus
set spelllang=en

" code folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=50

syntax on

highlight Normal guibg=NONE ctermbg=NONE
