vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

-- vim.env.FZF_DEFAULT_COMMAND = "fd --type file --color=always --hidden"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_perl_provider = 0

vim.g.snacks_animate = false

vim.opt.compatible = false
vim.opt.encoding = "UTF-8"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.errorbells = false
vim.opt.scrolloff = 18
vim.opt.laststatus = 2
vim.opt.showmode = false
vim.opt.textwidth = 120
vim.opt.breakindent = true
vim.opt.breakindentopt = "shift:2,min:40,sbr"
vim.opt.colorcolumn = ""
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
vim.opt.undofile = true
vim.opt.backup = true
vim.opt.writebackup = true
vim.opt.backupdir = os.getenv("HOME") .. "/.local/share/nvim/backup"
vim.opt.backupcopy = "yes"
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"
vim.opt.cmdheight = 1
vim.opt.hidden = true
vim.opt.spell = true
-- vim.opt.clipboard:append { "unnamedplus" }
vim.opt.clipboard = "unnamedplus"
vim.opt.spelllang = "en"
vim.opt.showbreak = "↪\\"
vim.opt.list = true
vim.opt.listchars = { trail = "⋅", tab = "▸·", nbsp = "␣", extends = "›", precedes = "‹" }
vim.opt.formatoptions:remove { "t" }
vim.opt.mouse = ""
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.opt.numberwidth = 4
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.autowrite = true
vim.opt.confirm = true

-- Ignore files
vim.opt.wildignore:append { "*.pyc", "*_build/*", "**/coverage/*", "**/node_modules/*", "**/android/*", "**/ios/*",
    "**/.git/*" }

-- code folding
vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()";
vim.opt.foldlevel = 50
-- vim.opt.foldlevelstart = 50
vim.opt.foldopen = "jump,block,hor,mark,percent,quickfix,search,tag,undo"
vim.opt.foldenable = true

vim.opt.completeopt = "menu,menuone,noinsert,noselect"

vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })

vim.diagnostic.config({
    virtual_lines = false,
    virtual_text = true
})
