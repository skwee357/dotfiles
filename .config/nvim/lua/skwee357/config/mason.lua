require("mason").setup();
local lspconfig = require("lspconfig")
local root_pattern = lspconfig.util.root_pattern
local configs = require("lspconfig.configs")
local lsp = require('skwee357.lsp')
local on_attach = lsp.common_on_attach
local make_capabilities = lsp.common_capabilities

if not configs.typespec then
    configs.typespec = {
        default_config = {
            cmd = { "tsp-server", "--stdio" },
            filetypes = {
                "typespec",
                "tsp",
            },
            root_dir = root_pattern({ "main.tsp" }),
            single_file_support = true,
            docs = {
                description = [[
  https://github.com/microsoft/typespec

  TypeSpec is a language for describing cloud service APIs and generating other API description languages, client and service code, documentation, and other assets. TypeSpec provides highly extensible core language primitives that can describe API shapes common among REST, OpenAPI, GraphQL, gRPC, and other protocols.

  Install:
  npm install -g @typespec/compiler
  ]],
            }
        }
    }
end

lspconfig.typespec.setup {}

lspconfig.qmlls.setup {}

require('mason-lspconfig').setup_handlers {
    function(server_name)
        if server_name == "rust_analyzer" or server_name == "rust-analyzer" then
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
        local capabilities = make_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        require 'lspconfig'.jsonls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                json = {
                    schemas = require 'schemastore'.json.schemas(),
                    validate = { enable = true }
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
            root_dir = root_pattern('tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.mjs', 'tailwind.config.ts', 'postcss.config.js', 'postcss.config.cjs', 'postcss.config.mjs', 'postcss.config.ts', 'package.json', 'node_modules', '.git'),
            settings = {
                tailwindCSS = {
                    classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
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
