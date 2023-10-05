call plug#begin(stdpath('data') . '/plugged')
" Eye candy
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mhinz/vim-startify'
Plug 'navarasu/onedark.nvim'

" Fuzzy Finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'BurntSushi/ripgrep' " dependency of todo-comments
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Navigation
Plug 'christoomey/vim-tmux-navigator'

" UI
Plug 'mbbill/undotree'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'folke/trouble.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'SmiteshP/nvim-navic'
Plug 'j-hui/fidget.nvim', { 'tag': 'legacy' }
Plug 'RRethy/vim-illuminate'
Plug 'kevinhwang91/nvim-bqf'
Plug 'MunifTanjim/nui.nvim' " dependecy for package-info.nvim
" Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'simrat39/symbols-outline.nvim'
" Plug 'folke/todo-comments.nvim'
Plug 'skwee357/nvim-prose'

" Helpers
Plug 'windwp/nvim-autopairs'
Plug 'numToStr/Comment.nvim'
Plug 'machakann/vim-sandwich'
Plug 'b0o/schemastore.nvim'

" Obsidian
Plug 'epwalsh/obsidian.nvim'

" Session
" Plug 'rmagatti/auto-session'

" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'kdheepak/lazygit.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'tpope/vim-fugitive'

" Language Tools
Plug 'nvim-lua/plenary.nvim'
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'windwp/nvim-ts-autotag'
Plug 'saecki/crates.nvim', { 'tag': 'v0.3.0' }
Plug 'vuki656/package-info.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'akinsho/flutter-tools.nvim'
" Plug 'pantharshit00/vim-prisma'
Plug 'wuelnerdotexe/vim-astro'
Plug 'dhruvasagar/vim-table-mode'
" Plug 'lervag/vimtex'
Plug 'amadeus/vim-mjml'
" Plug 'pmizio/typescript-tools.nvim'

" Markdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'preservim/vim-pencil'

" Tests
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest'
Plug 'haydenmeade/neotest-jest'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'norcalli/nvim-colorizer.lua'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'onsails/lspkind.nvim'

" Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
" Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

call plug#end()

" set background=dark
" colorscheme onedark

" let g:auto_session_root_dir = stdpath('data') . '/sessions/'

let g:onedark_terminal_italics = 1

let g:undotree_WindowLayout = 4
let g:undotree_SplitWidth = 40
let g:undotree_SetFocusWhenToggle = 1

" let g:Illuminate_ftblacklist = ['undotree', 'nvimtree']

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
