vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
vim.opt.colorcolumn = ""
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.cmdheight = 1
vim.opt.hidden = true
vim.opt.spell = true
vim.opt.clipboard:append { "unnamedplus" }
vim.opt.spelllang = "en"
vim.opt.showbreak = "↪\\"
vim.opt.list = true
vim.opt.listchars = { trail = "⋅", tab = "▸·", nbsp = "␣", extends = "›", precedes = "‹" }
vim.opt.sessionoptions:remove { "blank" }
vim.opt.formatoptions:remove { "t" }
vim.opt.mouse = ""

-- Ignore files
vim.opt.wildignore:append { "*.pyc", "*_build/*", "**/coverage/*", "**/node_modules/*", "**/android/*", "**/ios/*",
    "**/.git/*" }

-- code folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 50

vim.opt.completeopt = "menu,menuone,noinsert,noselect"

vim.g.goyo_width = 120
