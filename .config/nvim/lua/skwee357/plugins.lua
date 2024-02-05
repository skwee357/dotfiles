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
        lazy = true,
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
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        opts = require('skwee357.config.neotree'),
        -- keys = {
        --     { "<Leader>e", ":Neotree toggle left<CR>", desc = "Neotree toggle left" },
        -- },
        -- cmd = { "Neotree" }
    },
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
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = require("skwee357.config.bufferline"),
    },
    { "neovim/nvim-lspconfig" },
    {
        "SmiteshP/nvim-navic",
        dependencies = { "neovim/nvim-lspconfig" },
        opts = {
            highlight = true
        }
    },
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
        version = '^3', -- Recommended
        ft = { 'rust' },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
            {
                "lvimuser/lsp-inlayhints.nvim",
                opts = {}
            },
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
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
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
                "eslint",
                -- "gopls",
                -- "graphql",
                "html",
                "jsonls",
                "tsserver",
                "lua_ls",
                "prismals",
                "pyright",
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
        "Shatur/neovim-session-manager",
        event = "VimEnter",
        config = function()
            require("session_manager").setup({
                autosave_only_in_session = true,
                autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
            })
        end
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
            "rouge8/neotest-rust"
        },
        config = function()
            require('neotest').setup({
                adapters = {
                    require("neotest-rust")
                }
            })
        end
    },
})
