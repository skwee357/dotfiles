require 'skwee357.plugins.colorscheme'
require 'skwee357.plugins.autopairs'
require 'skwee357.config.treesitter'
require 'skwee357.config.lsp'
require 'skwee357.config.cmp'
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
require 'colorizer'.setup {}
require 'fidget'.setup {}
require 'spellsitter'.setup {}

require 'rust-tools'.setup {}
require 'crates'.setup {}
require 'package-info'.setup {}
require 'lspsaga'.init_lsp_saga({
    code_action_lightbulb = {
        enable = false,
        sign = false,
    }
});
