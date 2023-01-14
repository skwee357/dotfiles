require('skwee357.set')

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
    pattern = { "*.rs", "*.dart" },
    callback = function()
        vim.lsp.buf.format()
    end
})

autocmd('FileType', {
    pattern = "undotree",
    callback = function()
        vim.opt_local.signcolumn = "no"
    end
})

local cursor_line_group = augroup('CursorLine', {})
local yank_group = augroup('HighlightYank', {})

autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
    group = cursor_line_group,
    pattern = "*",
    callback = function()
        vim.opt_local.cursorline = true
    end
})

autocmd({ "WinLeave" }, {
    group = cursor_line_group,
    pattern = "*",
    callback = function()
        vim.opt_local.cursorline = false
    end
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 100
        })
    end
})

require 'Comment'.setup {}
require 'trouble'.setup {}
require 'colorizer'.setup {
    'css';
}
require 'fidget'.setup {}
require 'spellsitter'.setup {}

require 'rust-tools'.setup {}
require 'crates'.setup {}
require 'package-info'.setup {}
-- require 'lspsaga'.setup({
--     lightbulb = {
--         enable = false,
--         sign = false,
--     },
--     symbol_in_winbar = {
--         enable = false
--     }
-- });

-- require 'fzf-lua'.setup {
--     file_ignore_patterns = { "^node_modules/" }
-- }
