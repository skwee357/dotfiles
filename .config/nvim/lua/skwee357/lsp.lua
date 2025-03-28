local navic = require 'nvim-navic'
local cmp = require 'cmp_nvim_lsp'

local M = {}

vim.g.navic_silence = true

M.common_on_attach = function(client, bufnr)
    require 'illuminate'.on_attach(client)

    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end

    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr })
    end
end

M.common_capabilities = function()
    return cmp.default_capabilities()
end

return M
