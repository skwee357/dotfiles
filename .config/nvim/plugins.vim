call plug#begin(stdpath('data') . '/plugged')
" Eyecanndy
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'joshdick/onedark.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'mhinz/vim-startify'
Plug 'navarasu/onedark.nvim'

" Fuzzy Finding
" Plug '/opt/homebrew/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Navigation
Plug 'christoomey/vim-tmux-navigator'

" UI
Plug 'mbbill/undotree'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'simrat39/symbols-outline.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'folke/trouble.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'SmiteshP/nvim-gps'
Plug 'j-hui/fidget.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'RRethy/vim-illuminate'
" Plug 'rmagatti/goto-preview'
Plug 'kevinhwang91/nvim-bqf'

" Helpers
Plug 'windwp/nvim-autopairs'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'numToStr/Comment.nvim'
" Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'
Plug 'b0o/schemastore.nvim'
Plug 'windwp/nvim-ts-autotag'

" Session management
Plug 'rmagatti/auto-session'

" Language Tools
Plug 'nvim-lua/plenary.nvim'
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'
" Plug 'jose-elias-alvarez/null-ls.nvim'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'norcalli/nvim-colorizer.lua'

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

set completeopt=menu,menuone,noinsert,noselect

" autocmd FileType nerdtree setlocal signcolumn=no
autocmd FileType undotree setlocal signcolumn=no

let g:auto_session_root_dir = stdpath('data') . '/sessions/'

" Automatically close nvim-tree if its the last window
" autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

let g:onedark_terminal_italics = 1

let g:undotree_WindowLayout = 4
let g:undotree_SplitWidth = 40
let g:undotree_SetFocusWhenToggle = 1

let g:Illuminate_ftblacklist = ['undotree', 'nvimtree']

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

" change cursor to line in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

let $FZF_DEFAULT_COMMAND = "fd --type file --color=always --hidden"
