local lsp_installer = require'nvim-lsp-installer'

local servers = {
    'cssls',
    'dockerls',
    'eslint',
    'html',
    'jsonls',
    'rust_analyzer',
    'sumneko_lua',
    'tsserver',
    'vimls',
    'yamlls'
}

local function on_attach(client, bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

local enhance_server_opts = {
    ['jsonls'] = function(opts)
        opts.settings = {
            json = {
                schemas = {
                    {
                        fileMatch = {'.eslintrc'},
                        url = 'https://json.schemastore.org/eslintrc.json'
                    },
                    {
                        fileMatch = {'package.json'},
                        url = 'https://json.schemastore.org/package.json'
                    },
                    {
                        fileMatch = {'tsconfig.json'},
                        url = 'https://json.schemastore.org/tsconfig.json'
                    },
                    {
                        fileMatch = {'tslint.json'},
                        url = 'https://json.schemastore.org/tslint.json'
                    }
                }
            }
        }
    end,
    ['sumneko_lua'] = function(opts)
        opts.settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim", "use" }
                }
            }
        }
    end
}

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = on_attach
    }

    opts.capabilities = vim.lsp.protocol.make_client_capabilities()
    opts.capabilities = require('cmp_nvim_lsp').update_capabilities(opts.capabilities)

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    if enhance_server_opts[server.name] then
        enhance_server_opts[server.name](opts)
    end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

-- Install servers
for _, name in pairs(servers) do
    local found, server = lsp_installer.get_server(name)
    if found and not server:is_installed() then
        print("Installing LSP Server " .. name)
        server:install()
    end
end
