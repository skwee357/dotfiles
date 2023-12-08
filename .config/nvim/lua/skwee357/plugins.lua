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
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            file_ignore_patterns = { "^node_modules/", "^.yarn/" }
        }
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
        opts = {
            actions = {
                open_file = {
                    quit_on_open = true
                }
            },
            update_focused_file = {
                enable = true
            },
            renderer = {
                highlight_opened_files = "all"
            }
        },
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
        opts = {

            options = {
                offsets = {
                    {
                        filetype = 'NvimTree',
                        text = 'File Explorer',
                        text_align = 'left',
                        separator = true
                    }
                },
                show_buffer_close_icons = false,
                get_element_icon = function(element)
                    local icon, hl = require("nvim-web-devicons").get_icon_by_filetype(element.filetype,
                        { default = false })
                    return icon, hl
                end,
                show_close_icon = false,
            }
        }
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
    { "simrat39/symbols-outline.nvim" },
    { "skwee357/nvim-prose" },
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
    { "machakann/vim-sandwich" },
    { "b0o/schemastore.nvim" },
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
        "simrat39/rust-tools.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("skwee357.config.rust")
        end
    },
    { "windwp/nvim-ts-autotag" },
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
        run = ":TSUpdate",
        config = function()
            require("skwee357.config.treesitter")
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        }
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        }
    },
    {
        "norcalli/nvim-colorizer.lua",
        opts = {
            "css"
        }
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
            "cmp-nvim-lsp",
            "cmp_luasnip",
            "cmp-buffer",
            "cmp-path",
            "cmp-cmdline",
            "lspkind.nvim"
        },
        config = function()
            require("skwee357.config.lsp")
        end
    },
    { "hrsh7th/cmp-nvim-lsp",     lazy = true },
    { "saadparwaiz1/cmp_luasnip", lazy = true },
    { "hrsh7th/cmp-buffer",       lazy = true },
    { "hrsh7th/cmp-path",         lazy = true },
    { "hrsh7th/cmp-cmdline",      lazy = true },
    { "onsails/lspkind.nvim",     lazy = true },
    {
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp"
        }
    }
})
