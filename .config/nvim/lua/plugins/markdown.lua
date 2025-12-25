return {
    {
        "preservim/vim-markdown",
        dependencies = { "godlygeek/tabular" },
        config = function()
            -- disable header folding
            vim.g.vim_markdown_folding_disabled = 1

            -- do not use conceal feature, the implementation is not so good
            vim.g.vim_markdown_conceal = 0

            -- disable math tex conceal feature
            vim.g.tex_conceal = ""
            vim.g.vim_markdown_math = 1

            -- support front matter of various format
            vim.g.vim_markdown_frontmatter = 1      -- for YAML format
            vim.g.vim_markdown_toml_frontmatter = 1 -- for TOML format
            vim.g.vim_markdown_json_frontmatter = 1 -- for JSON format
        end
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
        ft = { "markdown", "codecompanion" }
    },
    { "dhruvasagar/vim-table-mode" },
}
