local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
parser_config.wgsl = {
  install_info = {
    url = "https://github.com/szebniok/tree-sitter-wgsl",
    files = { "src/parser.c" }
  }
}
require 'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "comment",
    "cpp",
    "css",
    "dart",
    "dockerfile",
    "go",
    "gomod",
    "graphql",
    "help",
    "html",
    "http",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "jsonc",
    "kotlin",
    "latex",
    "lua",
    "make",
    "python",
    "query",
    "regex",
    "ruby",
    "rust",
    "scss",
    "todotxt",
    "toml",
    "typescript",
    "vim",
    "yaml",
    "wgsl"
  },

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = {},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is the name of the parser)
    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
  rainbow = {
    enable = false,
    -- disable = { "jsx" }
    extended_mode = true
  },
  autotag = {
    enable = true
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      }
    }
  }
}
