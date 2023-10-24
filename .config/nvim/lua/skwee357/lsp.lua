local navic = require 'nvim-navic'
local cmp = require 'cmp_nvim_lsp'

local M = {}

M.common_on_attach = function(client, bufnr)
    require 'illuminate'.on_attach(client)

    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

M.common_capabilities = function()
    return cmp.default_capabilities()
end

return M
