require("mason").setup();
local root_pattern = require 'lspconfig'.util.root_pattern
local lsp = require('skwee357.lsp')
local on_attach = lsp.common_on_attach
local make_capabilities = lsp.common_capabilities

require('mason-lspconfig').setup_handlers {
    function(server_name)
        if server_name == "rust_analyzer" then
            -- handled by a rust plugin
        else
            require('lspconfig')[server_name].setup {
                on_attach = on_attach,
                capabilities = make_capabilities()
            }
        end
    end,
    ['cssls'] = function()
        local capabilities = make_capabilities()
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
            on_attach = function(client, bufnr)
                -- client.server_capabilities.documentSymbolProvider = true
                on_attach(client, bufnr)
            end,
            capabilities = make_capabilities(),
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
            capabilities = make_capabilities(),
            filetypes = { "html", "gohtmltmpl", "htmldjango" },
            init_options = {
                configurationSection = { "html", "css", "javascript" },
                embeddedLanguages = {
                    css = true,
                    javascript = true
                },
                provideFormatter = true
            }
        }
    end,
    ['jsonls'] = function()
        require 'lspconfig'.jsonls.setup {
            on_attach = on_attach,
            capabilities = make_capabilities(),
            settings = {
                json = {
                    schemas = require 'schemastore'.json.schemas {
                        select = {
                            '.eslintrc',
                            'package.json',
                            'tsconfig.json'
                        }
                    }
                }
            }
        }
    end,
    ['pyright'] = function()
        require 'lspconfig'.pyright.setup {
            on_attach = on_attach,
            capabilities = make_capabilities(),
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = "openFilesOnly",
                        useLibraryCodeForTypes = true
                    }
                }
            }
        }
    end,
    ['tailwindcss'] = function()
        require 'lspconfig'.tailwindcss.setup {
            on_attach = on_attach,
            capabilities = make_capabilities(),
            root_dir = root_pattern('tailwind.config.js', 'tailwind.config.ts', 'tailwind.config.cjs'),
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
    ['lua_ls'] = function()
        require 'lspconfig'.lua_ls.setup {
            on_attach = on_attach,
            capabilities = make_capabilities(),
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
            on_attach = on_attach,
            capabilities = make_capabilities(),
            cmd = { "ltex-ls" },
            filetypes = { "markdown", "text", "asciidoc" },
            flag = { debounce_text_changes = 300 },
            settings = {
                ltex = {
                    additionalRules = {
                        motherTongue = "ru-RU"
                    }
                }
            }
        }
    end
}
