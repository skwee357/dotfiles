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
local ft_detect_group = augroup('FileTypeDetect', {})

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

autocmd({ "BufRead", "BufNewFile" }, {
    group = ft_detect_group,
    pattern = "*.wgsl",
    callback = function()
        vim.opt.filetype = "wgsl"
    end
})

require 'skwee357.plugins.colorscheme'
require 'skwee357.plugins.autopairs'
require 'skwee357.config.treesitter'
require 'skwee357.config.lsp'
require 'skwee357.config.cmp'
require 'skwee357.plugins.mason'
require 'skwee357.plugins.nullls'
require 'skwee357.plugins.gitsigns'
require 'skwee357.plugins.statusline'
require 'skwee357.plugins.filetree'
-- require 'skwee357.plugins.bufferline'
require 'skwee357.plugins.indentline'
require 'skwee357.plugins.flutter'
require 'skwee357.plugins.neotest'
require 'skwee357.plugins.dap'

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

require 'true-zen'.setup {
    integrations = {
        lualine = true
    }
}

require 'telescope'.setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
        }
    }
}

require 'telescope'.load_extension('fzf')

-- require 'fzf-lua'.setup {
--     file_ignore_patterns = { "^node_modules/" }
-- }
