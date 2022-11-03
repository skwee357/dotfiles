require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        "cssls",
        "dockerls",
        "eslint",
        "gopls",
        -- "graphql",
        "html",
        "jsonls",
        "tsserver",
        "sumneko_lua",
        "prismals",
        "pyright",
        "solargraph",
        "rust_analyzer",
        "sqls",
        "taplo",
        "tailwindcss",
        "vimls",
        "yamlls"
    }
})

local navic = require 'nvim-navic'
local root_pattern = require 'lspconfig'.util.root_pattern
local cmp = require 'cmp_nvim_lsp'

local function on_attach(client, bufnr)
    require 'illuminate'.on_attach(client)

    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end

    if client.name == 'eslint' then
        client.server_capabilities.document_formatting = true
        client.server_capabilities.document_range_formatting = true
    elseif client.name == 'tsserver' then
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
    end
end

require('mason-lspconfig').setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            on_attach = on_attach,
            capabilities = cmp.default_capabilities()
        }
    end,
    ['cssls'] = function()
        local capabilities = cmp.default_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        require 'lspconfig'.cssls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                css = { validate = true },
                less = { validate = true },
                scss = { validate = true },
            }
        }
    end,
    ['eslint'] = function()
        require 'lspconfig'.eslint.setup {
            on_attach = on_attach,
            capabilities = cmp.default_capabilities(),
            settings = {
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
        }
    end,
    ['html'] = function()
        require 'lspconfig'.html.setup {
            on_attach = on_attach,
            capabilities = cmp.default_capabilities(),
            filetypes = { "html", "gohtmltmpl" }
        }
    end,
    ['jsonls'] = function()
        require 'lspconfig'.jsonls.setup {
            on_attach = on_attach,
            capabilities = cmp.default_capabilities(),
            settings = {
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
        }
    end,
    ['pyright'] = function()
        require 'lspconfig'.pyright.setup {
            on_attach = on_attach,
            capabilities = cmp.default_capabilities(),
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = "workspace",
                        useLibraryCodeForTypes = true
                    }
                }
            }
        }
    end,
    ['tailwindcss'] = function()
        require 'lspconfig'.tailwindcss.setup {
            on_attach = on_attach,
            capabilities = cmp.default_capabilities(),
            root_dir = root_pattern('tailwind.config.js', 'tailwind.config.ts'),
            settings = {
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
        }
    end,
    ['sumneko_lua'] = function()
        require 'lspconfig'.sumneko_lua.setup {
            on_attach = on_attach,
            capabilities = cmp.default_capabilities(),
            settings = {
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
        }
    end,
    ['ltex'] = function()
        require 'lspconfig'.ltex.setup {
            settings = {
                ltex = {
                    additionalRules = {
                        languageModel = '~/.ngrams/',
                    }
                }
            }
        }
    end
}
