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

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local border = 'rounded'

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local function on_attach(client, bufnr)
    require'lsp_signature'.on_attach({
        bind = true,
        handler_opts = {
            border = "rounded"
        },
        hint_prefix = ""
    }, bufnr)

    require'illuminate'.on_attach(client)
end

local enhance_server_opts = {
    ['jsonls'] = function(opts)
        opts.settings = {
            json = {
                schemas = require'schemastore'.json.schemas {
                    select = {
                        '.eslintrc',
                        'package.json',
                        'tsconfig.json',
                        'tslint.json'
                    }
                }
            }
        }
    end,
    ['sumneko_lua'] = function(opts)
        opts.settings = {
            Lua = {
                diagnostics = {
                    enable = true,
                    globals = { "vim" }
                },
                workspace = {
                    library = {
                        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                    }
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
