call plug#begin(stdpath('data') . '/plugged')
" Eyecanndy
Plug 'ellisonleao/gruvbox.nvim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
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
" Plug 'preservim/nerdtree'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'kyazdani42/nvim-tree.lua'

" Helpers
Plug 'windwp/nvim-autopairs'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'numToStr/Comment.nvim'
" Plug 'folke/which-key.nvim'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
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

" autocmd FileType nerdtree setlocal signcolumn=no
autocmd FileType undotree setlocal signcolumn=no

" Automatically close nvim-tree if its the last window
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

let g:onedark_terminal_italics = 1

" let g:airline_theme = 'base16_gruvbox_dark_hard'
" let g:airline_theme = 'onedark'
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#nvimlsp#enabled = 1

let g:undotree_WindowLayout = 2
let g:undotree_SplitWidth = 30
let g:undotree_SetFocusWhenToggle = 1

let s:startify_ascii_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\ '',
\]
let g:startify_custom_header = map(s:startify_ascii_header + startify#fortune#quote(), '"   ".v:val')

let g:startify_bookmarks = ['.config/nvim']
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:nvim_tree_highlight_opened_files = 1

" let g:webdevicons_enable = 1
" let g:webdevicons_conceal_nerdtree_brackets = 1
" let g:webdevicons_enable_nerdtree = 1

" let NERDTreeShowLineNumbers = 0
" let NERDTreeHijackNetrw = 1
" let NERDTreeHighlightCursorline = 1
" let NERDTreeWinSize = 40
" let NERDTreeQuitOnOpen = 1
" let NERDTreeShowHidden = 0

" change cursor to line in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

let $FZF_DEFAULT_COMMAND = "fd --type file --color=always --hidden"
