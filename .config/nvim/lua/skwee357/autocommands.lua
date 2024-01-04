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

local goyo_group = augroup('GoyoGroup', {})

autocmd('User', {
    pattern = 'GoyoEnter',
    callback = function()
        require('lualine').hide();
        vim.api.nvim_set_option('showtabline', 0)
        vim.cmd("Limelight")
    end,
    group = goyo_group
})

autocmd('User', {
    pattern = 'GoyoLeave',
    callback = function()
        require('lualine').hide({ unhide = true })
        vim.api.nvim_set_option('showtabline', 2)
        vim.cmd('Limelight!')
    end,
    group = goyo_group
})

autocmd('FileType', {
    pattern = "markdown",
    command = "call pencil#init({'wrap': 'soft'})"
})
