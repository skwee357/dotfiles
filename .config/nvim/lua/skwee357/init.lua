vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
require 'skwee357.plugins.bufferline'
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
require 'lspsaga'.setup({
    lightbulb = {
        enable = false,
        sign = false,
    }
});

require 'true-zen'.setup {
    integrations = {
        lualine = true
    }
}

require 'fzf-lua'.setup {
    file_ignore_patterns = { "^node_modules/" }
}
