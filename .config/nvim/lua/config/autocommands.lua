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
