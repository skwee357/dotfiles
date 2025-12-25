--@type vim.lsp.Config
return {
    settings = {
        Lua = {
            diagnostics = {
                enable = true,
                globals = { "vim" }
            },
            workspace = {
                library = {
                    vim.env.VIMRUNTIME,
                }
            },
            telemetry = {
                enable = false
            }
        }
    }
}
