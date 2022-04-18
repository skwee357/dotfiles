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
set textwidth=120
set colorcolumn=0
set undodir=~/.local/share/nvim/undodir
set undofile
set nobackup
set nowritebackup
set noswapfile
set signcolumn=yes
set termguicolors
set cmdheight=1
set hidden
set clipboard+=unnamedplus
set spelllang=en
set showbreak=↪\
set list
set listchars=trail:⋅,tab:▸·,nbsp:␣,extends:›,precedes:‹
" set listchars=space:⋅,tab:▸·,eol:↲

" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" code folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=50

syntax on

highlight Normal guibg=NONE ctermbg=NONE
