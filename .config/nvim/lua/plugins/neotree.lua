return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
            "s1n7ax/nvim-window-picker"
        },
        lazy = false, -- neo-tree will lazily load itself
        config = function()
            require('neo-tree').setup({
                close_if_last_window = true,
                event_handlers = {
                    {
                        -- event = "file_open_requested",
                        event = "file_opened",
                        handler = function()
                            require("neo-tree.command").execute({ action = "close" })
                        end
                    },

                },
                window = {
                    position = "left",
                    width = 40,
                    mappings = {
                        ["<cr>"] = "open_with_window_picker"
                    }
                },
                filesystem = {
                    filtered_items = {
                        always_show = {
                            ".gitignore"
                        },
                        always_show_by_pattern = {
                            ".env*",
                            "PLAN.md"
                        }
                    },
                    follow_current_file = {
                        enabled = true
                    }
                }
            })
        end
    },
    {
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
        },
        config = function()
            require("lsp-file-operations").setup()
        end,
    },
    {
        "s1n7ax/nvim-window-picker",
        version = "2.*",
        config = function()
            require("window-picker").setup({
                hint = "floating-letter",
                filter_rules = {
                    include_current_win = false,
                    autoselect_one = true,
                    -- filter using buffer options
                    bo = {
                        -- if the file type is one of following, the window will be ignored
                        filetype = { "neo-tree", "neo-tree-popup", "notify" },
                        -- if the buffer type is one of following, the window will be ignored
                        buftype = { "terminal", "quickfix" },
                    },
                },
            })
        end,
    },
}
