return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                -- jinja = { "djlint" },
                handlebars = { "prettierd" },
                html = { "htmlbeautifier" },
                mjml = { "prettierd" },
                svelte = { "prettierd" },
                json = { "prettierd" },
                -- astro = { "prettierd" },
                typescript = { "prettierd" },
                typescriptreact = { "prettierd" },
                javascript = { "prettierd" },
                eruby = { "erb_format" },
                ["eruby.turbo_stream"] = { "erb_format" },
                typst = { "typstyle" },
                sql = { "sql_formatter" },
                yaml = { "yamlfmt" }
            },
            format_on_save = {
                timeout_ms = 800,
                lsp_format = "fallback"
            }
        });
    end
}
