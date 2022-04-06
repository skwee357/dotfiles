call plug#begin(stdpath('data') . '/plugged')
" Eyecanndy
Plug 'ellisonleao/gruvbox.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'mhinz/vim-startify'

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

" Helpers
Plug 'windwp/nvim-autopairs'
Plug 'lewis6991/gitsigns.nvim'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP
" Plug 'neovim/nvim-lspconfig'
" Plug 'williamboman/nvim-lsp-installer'
" Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
call plug#end()

set background=dark
colorscheme onedark

set completeopt=menu,menuone,noselect

let g:onedark_terminal_italics = 1

" let g:airline_theme = 'base16_gruvbox_dark_hard'
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1

let g:undotree_WindowLayout = 2
let g:undotree_SplitWidth = 30
let g:undotree_SetFocusWhenToggle = 1

let g:webdevicons_conceal_nerdtree_brackets = 1

let NERDTreeShowLineNumbers = 0
let NERDTreeHijackNetrw = 1
let g:NERDTreeWinSize = 40

" change cursor to line in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

let $FZF_DEFAULT_COMMAND = "fd --type file --color=always --hidden"
