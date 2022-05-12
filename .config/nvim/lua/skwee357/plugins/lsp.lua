local lsp_installer = require 'nvim-lsp-installer'
local root_pattern = require 'lspconfig'.util.root_pattern
local null_ls = require'null-ls'

-- local servers = {
--     'bashls',
--     'cssls',
--     'dockerls',
--     'eslint',
--     'gopls',
--     'html',
--     'jsonls',
--     'pyright',
--     'rust_analyzer',
--     'sqls',
--     'sumneko_lua',
--     'taplo',
--     'tailwindcss',
--     'tsserver',
--     'vimls',
--     'yamlls'
-- }

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

null_ls.setup {
    sources = {
        -- null_ls.builtins.formatting.gofmt,
        -- null_ls.builtins.formatting.jq,
        -- null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.black
    }
}

-- require 'lsp_signature'.setup({
--     bind = true,
--     handler_opts = {
--         border = "single"
--     },
--     floating_window = true,
--     hint_enable = false,
    -- hint_prefix = ""
-- })

local function on_attach(client, bufnr)
    require 'illuminate'.on_attach(client)

    if client.name == 'eslint' then
        client.resolved_capabilities.document_formatting = true
        client.resolved_capabilities.document_range_formatting = true
    elseif client.name == 'tsserver' then
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end
end

local enhance_server_opts = {
    ['cssls'] = function(opts)
        opts.settings = {
            css = { validate = true },
            less = { validate = true },
            scss = { validate = true },
        }
    end,
    ['eslint'] = function(opts)
        opts.settings = {
            codeAction = {
                disableRuleComment = {
                    enable = true,
                    location = "separateLine"
                },
                showDocumentation = {
                    enable = true
                }
            },
            codeActionOnSave = {
                enable = false,
                mode = "all"
            },
            format = true,
            nodePath = "",
            onIgnoredFiles = "off",
            packageManager = "npm",
            quiet = false,
            rulesCustomizations = {},
            run = "onType",
            useESLintClass = false,
            validate = "on",
            workingDirectory = {
                mode = "location"
            }
        }
    end,
    ['html'] = function(opts)
        opts.filetypes = { "html", "gohtmltmpl" }
    end,
    ['jsonls'] = function(opts)
        opts.settings = {
            json = {
                schemas = require 'schemastore'.json.schemas {
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
    ['pyright'] = function(opts)
        opts.settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "workspace",
                    useLibraryCodeForTypes = true
                }
            }
        }
    end,
    ['tailwindcss'] = function(opts)
        opts.root_dir = root_pattern('tailwind.config.js', 'tailwind.config.ts')
        opts.settings = {
            tailwindCSS = {
                classAttributes = { "class", "className", "classList", "ngClass" },
                lint = {
                    cssConflict = "warning",
                    invalidApply = "error",
                    invalidConfigPath = "error",
                    invalidScreen = "error",
                    invalidTailwindDirective = "error",
                    invalidVariant = "error",
                    recommendedVariantOrder = "warning"
                },
                validate = true
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
-- for _, name in pairs(servers) do
--     local found, server = lsp_installer.get_server(name)
--     if found and not server:is_installed() then
--         print("Installing LSP Server " .. name)
--         server:install()
--     end
-- end
