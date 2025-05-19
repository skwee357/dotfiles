return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "mason-org/mason.nvim" },
        { "mason-org/mason-lspconfig.nvim" }
    },
    priority = 1000,
    config = function()
        require("mason").setup();

        require("mason-lspconfig").setup({
            ensure_installed = {
                "cssls",
                "dockerls",
                -- "eslint",
                -- "gopls",
                -- "graphql",
                "html",
                "jsonls",
                "ts_ls",
                "lua_ls",
                -- "prismals",
                "pylsp",
                -- "solargraph",
                "rust_analyzer",
                "sqlls",
                "taplo",
                "tailwindcss",
                "vimls",
                "yamlls"
            }
        })
    end
}
