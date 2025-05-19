return {
    { "rust-lang/rust.vim" },
    -- {
    --     'mrcjkb/rustaceanvim',
    --     version = '^4', -- Recommended
    --     ft = { 'rust' },
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "mfussenegger/nvim-dap",
    --     },
    --     config = function()
    --         vim.g.rustaceanvim = {
    --             tools = {
    --                 executor = require('rustaceanvim.executors').termopen,
    --                 reload_workspace_from_cargo_toml = true,
    --                 hover_actions = {
    --                     auto_focus = true,
    --                 },
    --             },
    --             server = {
    --                 default_settings = {
    --                     ['rust-analyzer'] = {
    --                         lens = {
    --                             enable = true
    --                         },
    --                         checkOnSave = {
    --                             enable = true,
    --                             command = 'clippy'
    --                         }
    --                     }
    --                 }
    --             }
    --         };
    --     end,
    -- },
    {
        "saecki/crates.nvim",
        tag = "stable",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("crates").setup()
        end,
    }
}
