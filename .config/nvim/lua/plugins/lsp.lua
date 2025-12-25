return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "mason-org/mason.nvim" },
        { "mason-org/mason-lspconfig.nvim" }
    },
    priority = 1000,
    config = function()
        -- require("lspconfig");
        require("mason").setup();

        -- for _, f in pairs(vim.api.nvim_get_runtime_file('lsp/*.lua', true)) do
        --         local name = vim.fn.fnamemodify(f, ':t:r')
        --         local cmd = dofile(f).cmd[1]
        --         if vim.fn.executable(cmd) == 0 then
        --             -- vim.cmd("MasonInstall " .. name)
        --         end
        --         vim.lsp.config(name)
        --     end
        --
        --         for _, file in ipairs(vim.fn.globpath(lsp_dir, "*.lua", false, true)) do
        --             -- Read the first line of the file
        --             local f = io.open(file, "r")
        --             local first_line = f and f:read("*l") or ""
        --             if f then
        --                 f:close()
        --             end
        --             -- Only include the file if it doesn't start with "-- disable"
        --             if not first_line:match("^%-%- disable") then
        --                 local name = vim.fn.fnamemodify(file, ":t:r") -- `:t` gets filename, `:r` removes extension
        --                 table.insert(lsp_files, name)
        --             end
        --         end
        --
        --         vim.lsp.config(lsp_files)

        require("mason-lspconfig").setup({
            ensure_installed = {
                "astro",
                "beancount",
                "cssls",
                "dockerls",
                -- "eslint",
                -- "gopls",
                -- "graphql",
                "html",
                "jsonls",
                -- "ts_ls",
                "lua_ls",
                -- "prismals",
                -- "pyright",
                -- "pylsp",
                -- "solargraph",
                "rust_analyzer",
                "rubocop",
                "ruby_lsp",
                "marksman",
                -- "sqlls",
                "taplo",
                "tailwindcss",
                "vimls",
                "yamlls",
                "ltex_plus",
                -- "htmx",
                "svelte",
            },

            automatic_enable = true
        })
    end
}
