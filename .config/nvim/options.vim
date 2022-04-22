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
set cursorline
set cmdheight=1
set hidden
set clipboard+=unnamedplus
set spelllang=en
set showbreak=↪\
set list
set listchars=trail:⋅,tab:▸·,nbsp:␣,extends:›,precedes:‹
" set listchars=space:⋅,tab:▸·,eol:↲
set sessionoptions+=winpos,terminal,folds
set formatoptions-=t

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

" change cursor to line in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

let $FZF_DEFAULT_COMMAND = "fd --type file --color=always --hidden"

let g:markdown_fenced_languages = ['toml', 'html', 'python', 'javascript', 'typescript']
