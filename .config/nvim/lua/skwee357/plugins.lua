require('lazy').setup({
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "nvim-lua/plenary.nvim",       lazy = true },
    { "MunifTanjim/nui.nvim",        lazy = true },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "onedark.nvim",
            "nvim-navic",
            "nvim-prose"
        },
        config = function()
            require("skwee357.config.lualine")
        end
    },
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("skwee357.config.alpha")
        end
    },
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require('onedark').setup {
                style = 'dark',
                toggle_style_key = '<NOP>',
                highlights = {
                    LspSignatureActiveParameter = { fg = '$yellow' }
                }
            }

            require('onedark').load {}

            -- vim.cmd("color onedark")
        end,
    },
    -- {
    --     "ibhagwan/fzf-lua",
    --     dependencies = { "nvim-tree/nvim-web-devicons" },
    --     opts = {
    --         file_ignore_patterns = { "^node_modules/", "^.yarn/" }
    --     }
    -- },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build \
                     build --config Release && cmake --install build --prefix build",
            },
            {
                "nvim-telescope/telescope-live-grep-args.nvim",
                -- This will not install any breaking changes.
                -- For major updates, this must be adjusted manually.
                version = "^1.0.0",
            },
        },
        config = function()
            require("skwee357.config.telescope")
        end
    },
    { "christoomey/vim-tmux-navigator" },
    {
        "mbbill/undotree",
        config = function()
            vim.g.undotree_WindowLayout = 4
            vim.g.undotree_SplitWidth = 40
            vim.g.undotree_SetFocusWhenToggle = 1
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {
                actions = {
                    open_file = {
                        quit_on_open = true
                    }
                },
                update_focused_file = {
                    enable = true,
                },
            }
        end,
    },
    -- {
    --     "nvim-neo-tree/neo-tree.nvim",
    --     branch = "v3.x",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    --         "MunifTanjim/nui.nvim",
    --         -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    --     },
    --     opts = require('skwee357.config.neotree'),
    --     -- keys = {
    --     --     { "<Leader>e", ":Neotree toggle left<CR>", desc = "Neotree toggle left" },
    --     -- },
    --     -- cmd = { "Neotree" }
    -- },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = {
                char = "▏"
            }
        },
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            signs = false
        }
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = require("skwee357.config.bufferline"),
    },
    { "neovim/nvim-lspconfig" },
    -- {
    --     "SmiteshP/nvim-navic",
    --     dependencies = { "neovim/nvim-lspconfig" },
    --     opts = {
    --         highlight = true
    --     }
    -- },
    { "j-hui/fidget.nvim" },
    { "RRethy/vim-illuminate" },
    {
        "kevinhwang91/nvim-bqf",
        ft = "qf",
        opts = {},
    },
    { "skwee357/nvim-prose" },
    {
        "stevearc/aerial.nvim",
        opts = {
            highlight_on_hover = true,
            autojump = true,
            highlight_on_jump = false,
            manage_folds = true,
            show_guides = true,
            on_attach = function(bufnr)
                vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
            end
        },
        dependencies = {
            { "nvim-treesitter/nvim-treesitter" },
            { "nvim-tree/nvim-web-devicons" }
        }
    },
    {
        'windwp/nvim-autopairs',
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        },
        event = "InsertEnter",
        opts = {
            disable_filetype = { "nerdtree" },
            check_ts = true,
            ts_config = {
                lua = { "string", "source" },
                javascript = { "string", "template_string" }
            }
        }
    },
    { "numToStr/Comment.nvim", lazy = false, opts = {} },
    { "b0o/schemastore.nvim" },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("skwee357.config.gitsigns")
        end
    },
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    { "rust-lang/rust.vim" },
    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        ft = { 'rust' },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("skwee357.config.rust")
        end,
    },
    {
        "saecki/crates.nvim",
        tag = "stable",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("crates").setup()
        end,
    },
    {
        "vuki656/package-info.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim"
        }
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("skwee357.config.nullls")
        end
    },
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    jinja = { "djlint" },
                    handlebars = { "prettierd" },
                    html = { "prettierd" },
                    mjml = { "prettier" },
                    svelte = { "prettier" },
                    astro = { "prettier" },
                    typescript = { "prettier" },
                    typescriptreact = { "prettier" },
                    javascript = { "prettier" },
                    eruby = { "erb_format" },
                    ["eruby.turbo_stream"] = { "erb_format" },
                    typst = { "typstyle" }
                },
                format_on_save = {
                    timeout_ms = 800,
                    lsp_format = "fallback"
                }
            });
        end
    },
    { "wuelnerdotexe/vim-astro" },
    { "dhruvasagar/vim-table-mode" },
    { "godlygeek/tabular",         lazy = true },
    {
        "preservim/vim-markdown",
        dependencies = { "godlygeek/tabular" },
        config = function()
            -- disable header folding
            vim.g.vim_markdown_folding_disabled = 1

            -- do not use conceal feature, the implementation is not so good
            vim.g.vim_markdown_conceal = 0

            -- disable math tex conceal feature
            vim.g.tex_conceal = ""
            vim.g.vim_markdown_math = 1

            -- support front matter of various format
            vim.g.vim_markdown_frontmatter = 1      -- for YAML format
            vim.g.vim_markdown_toml_frontmatter = 1 -- for TOML format
            vim.g.vim_markdown_json_frontmatter = 1 -- for JSON format
        end
    },
    {
        "junegunn/goyo.vim",
        config = function()
            vim.g.goyo_width = 120
        end
    },
    {
        "junegunn/limelight.vim",
        dependencies = {
            "junegunn/goyo.vim"
        }
    },
    { "preservim/vim-pencil" },
    { "sheerun/vim-polyglot" },
    { "windwp/nvim-ts-autotag" },
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        -- build = function()
        --     require("nvim-treesitter.install").update({ with_sync = true })
        -- end,
        config = function()
            require("skwee357.config.treesitter")
        end,
        dependencies = {
            { "nvim-treesitter/nvim-treesitter-textobjects" },
            {
                "nvim-treesitter/nvim-treesitter-context",
                config = function()
                    require("treesitter-context").setup()
                end,
            },
            { "windwp/nvim-ts-autotag" },
            { "JoosepAlviste/nvim-ts-context-commentstring" },
        }
    },
    {
        "NvChad/nvim-colorizer.lua",
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("skwee357.config.mason")
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim"
        },
        lazy = true,
        opts = {
            ensure_installed = {
                "cssls",
                "dockerls",
                -- "eslint",
                -- "gopls",
                -- "graphql",
                "html",
                "jsonls",
                "ts_ls",
                "lua_ls",
                -- "prismals",
                "pylsp",
                -- "solargraph",
                "rust_analyzer",
                "sqlls",
                "taplo",
                "tailwindcss",
                "vimls",
                "yamlls"
            }
        }
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" },
            { "onsails/lspkind.nvim" },
        },
        config = function()
            require("skwee357.config.cmp")
        end
    },
    {
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
            dependencies = { "rafamadriz/friendly-snippets" },
        }
    },
    {
        'rmagatti/auto-session',
        lazy = false,

        ---enables autocomplete for opts
        ---@module "auto-session"
        ---@type AutoSession.Config
        opts = {
            auto_save = true,
            auto_restore = true,
            suppressed_dirs = { "~/", "~/Documents", "~/Downloads", "/" },
            bypass_save_filetypes = { "alpha", "netrw" }
        }
    },
    { "projectfluent/fluent.vim" },
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        opts = require("skwee357.config.dressing"),
    },
    { "amadeus/vim-mjml" },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "rouge8/neotest-rust",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            require('neotest').setup({
                adapters = {
                    require("neotest-rust")
                }
            })
        end
    },
    {
        "johmsalas/text-case.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("textcase").setup({})
            require("telescope").load_extension("textcase")
        end,
        keys = {
            "ga", -- Default invocation prefix
            { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "v" }, desc = "Telescope" },
        },
    },
    { 'kosayoda/nvim-lightbulb' },
    {
        "nvim-pack/nvim-spectre",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    { 'lepture/vim-jinja' },
    -- {
    --     "supermaven-inc/supermaven-nvim",
    --     config = function()
    --         require("supermaven-nvim").setup({
    --             log_level = "off",
    --             condition = function()
    --                 return true
    --                 -- return string.match(vim.fn.expand("%:t"), ".env")
    --             end
    --         })
    --         require("supermaven-nvim.api").stop();
    --     end,
    -- },
    { "polarmutex/beancount.nvim" },
    { "crispgm/cmp-beancount" },
    { 'echasnovski/mini.nvim',    version = false },
    { "tpope/vim-rails" },
    -- {
    --     "olimorris/codecompanion.nvim",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-treesitter/nvim-treesitter",
    --     },
    --     config = function()
    --         require("skwee357.config.codecompanion")
    --     end
    -- },
    -- {
    --     'milanglacier/minuet-ai.nvim',
    --     config = function()
    --         require("skwee357.config.minuet")
    --     end,
    -- },
    {
        'ggml-org/llama.vim',
        init = function()
            vim.g.llama_config = {
                show_info = false,
                keymap_trigger = "<C-F>",
                keymap_accept_line = "<A-a>",
                keymap_accept_full = "<A-A>",
                keymap_accept_word = "<A-j>"
            }
        end,
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },

    -- {
    --     "someone-stole-my-name/yaml-companion.nvim",
    --     dependencies = {
    --         "neovim/nvim-lspconfig",
    --         "nvim-lua/plenary.nvim",
    --         "nvim-telescope/telescope.nvim"
    --     },
    --     config = function()
    --         require("telescope").load_extension("yaml_schema")
    --     end
    -- }
    -- {
    --     "jackMort/ChatGPT.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("chatgpt").setup({
    --                 api_key_cmd = "op read op://Personal/OpenAI/credential --no-newline"
    --             })
    --     end,
    --     dependencies = {
    --         "MunifTanjim/nui.nvim",
    --         "nvim-lua/plenary.nvim",
    --         "folke/trouble.nvim",
    --         "nvim-telescope/telescope.nvim"
    --     }
    -- }
    { 'Bekaboo/dropbar.nvim' },
    -- {
    --     "luckasRanarison/tailwind-tools.nvim",
    --     name = "tailwind-tools",
    --     build = ":UpdateRemotePlugins",
    --     dependencies = {
    --         "nvim-treesitter/nvim-treesitter",
    --         "nvim-telescope/telescope.nvim", -- optional
    --         "neovim/nvim-lspconfig",         -- optional
    --     },
    --     --- @type TailwindTools.Option
    --     opts = {
    --         server = {
    --             override = true,
    --             settings = {
    --                 classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
    --                 includeLanguages = { eruby = "erb" },
    --                 lint = {
    --                     cssConflict = "warning",
    --                     invalidApply = "error",
    --                     invalidConfigPath = "error",
    --                     invalidScreen = "error",
    --                     invalidTailwindDirective = "error",
    --                     invalidVariant = "error",
    --                     recommendedVariantOrder = "warning"
    --                 },
    --                 validate = true
    --             },
    --         }
    --     }
    -- }
})
