local null_ls = require "null-ls"

null_ls.setup {
    sources = {
        -- null_ls.builtins.formatting.gofmt,
        -- null_ls.builtins.formatting.jq,
        -- null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.fixjson,
        null_ls.builtins.formatting.buf,
        -- null_ls.builtins.formatting.eslint_d,
        -- null_ls.builtins.formatting.cbfmt,
        -- null_ls.builtins.formatting.prettierd.with({
        --     extra_filetypes = { "jst", "ejs", "jinja", "html.handlebars" }
        -- }),
        -- null_ls.builtins.formatting.djlint.with({
        --     extra_filetypes = { "html.handlebars" }
        -- }),
        null_ls.builtins.diagnostics.eslint,
        -- null_ls.builtins.diagnostics.write_good,
        -- null_ls.builtins.diagnostics.alex,
        -- null_ls.builtins.diagnostics.proselint,
        -- null_ls.builtins.diagnostics.jsonlint,
        -- null_ls.builtins.diagnostics.eslint_d,
        -- null_ls.builtins.diagnostics.markdownlint,
        -- null_ls.builtins.code_actions.proselint,
        -- null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.diagnostics.protoc_gen_lint,
        -- null_ls.builtins.diagnostics.djlint.with({
        --     extra_filetypes = { "jinja" }
        -- }),
        -- null_ls.builtins.diagnostics.stylelint,
        -- null_ls.builtins.diagnostics.markuplint.with({
        --     extra_filetypes = { "jinja" }
        -- })
    }
}
