return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                jinja = { "djlint" },
                -- handlebars = { "prettier" },
                html = { "htmlbeautifier" },
                mjml = { "prettier" },
                svelte = { "prettier" },
                astro = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                javascript = { "prettier" },
                eruby = { "erb_format" },
                ["eruby.turbo_stream"] = { "erb_format" },
                typst = { "typstyle" },
                sql = { "sql_formatter" }
            },
            format_on_save = {
                timeout_ms = 800,
                lsp_format = "fallback"
            }
        });
    end
}
