-- local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
-- parser_config.wgsl = {
-- install_info = {
-- url = "https://github.com/szebniok/tree-sitter-wgsl",
-- files = { "src/parser.c" }
-- }
-- }
require 'nvim-treesitter.configs'.setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = "all",

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- List of parsers to ignore installing
    ignore_install = {},

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is the name of the parser)
        -- list of language that will be disabled
        disable = {
            "html"
        },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    ident = {
        enable = true,
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

                ["a="] = "@assignment.outer",
                ["i="] = "@assignment.inner",

                ["l="] = "@assignment.lhs",
                ["r="] = "@assignment.rhs",

                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",

                ["ai"] = "@conditional.outer",
                ["ii"] = "@conditional.inner",

                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",

                ["am"] = "@call.outer",
                ["im"] = "@call.inner",
            }
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]f"] = "@function.outer",
                ["]c"] = "@calss.outer",
                ["]i"] = "@conditional.outer",
                ["]l"] = "@loop.outer",
                ["]m"] = "@call.outer"
            },
            goto_next_end = {
                ["]F"] = "@function.outer",
                ["]C"] = "@calss.outer",
                ["]I"] = "@conditional.outer",
                ["]L"] = "@loop.outer",
                ["]M"] = "@call.outer"
            },
            goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[c"] = "@calss.outer",
                ["[i"] = "@conditional.outer",
                ["[l"] = "@loop.outer",
                ["[m"] = "@call.outer"
            },
            goto_previous_end = {
                ["[F"] = "@function.outer",
                ["[C"] = "@calss.outer",
                ["[I"] = "@conditional.outer",
                ["[L"] = "@loop.outer",
                ["[M"] = "@call.outer"
            }
        }
    }
}

require("ts_context_commentstring").setup({
    enable_autocmd = false,
})
