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
set cmdheight=2
set hidden
set clipboard=unnamedplus

syntax on

let mapleader = ';'

nnoremap <C-p> :Files<CR>
nnoremap <C-y> :Buffers<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>f :NERDTree<CR>

" Remove all trailing whitespaces
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

call plug#begin(stdpath('data') . '/plugged')
" Eyecanndy
Plug 'ellisonleao/gruvbox.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" Fuzzy Finding
Plug '/opt/homebrew/opt/fzf'
Plug 'junegunn/fzf.vim'

" Navigation
Plug 'christoomey/vim-tmux-navigator'

" UI
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Syntax
Plug 'sheerun/vim-polyglot'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP
Plug 'neovim/nvim-lspconfig'
" Plug 'williamboman/nvim-lsp-installer'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'
call plug#end()

set completeopt=menu,menuone,noselect

colorscheme gruvbox

set background=dark
highlight Normal guibg=NONE ctermbg=NONE

let g:airline_theme = 'base16_gruvbox_dark_hard'
let g:airline_powerline_fonts = 1

let g:undotree_WindowLayout = 2
let g:undotree_SplitWidth = 30
let g:undotree_SetFocusWhenToggle = 1

let NERDTreeShowLineNumbers = 1
let g:NERDTreeWinSize = 40

" change cursor to line in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

let $FZF_DEFAULT_COMMAND = "fd --type file --color=always --hidden"

autocmd FileType nerdtree setlocal signcolumn=no
autocmd FileType undotree setlocal signcolumn=no

lua require('config')
