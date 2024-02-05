local M = {
    close_if_last_window = true,
    event_handlers = {
        {
            event = "file_opened",
            handler = function(file_path)
                vim.cmd("Neotree close")
            end,
        }
    },
    window = {
        mappings = {
            ["C"] = "close_all_subnodes",
            ["Z"] = "expand_all_nodes",
        },
        fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
            ["<down>"] = "move_cursor_down",
            ["<C-n>"] = "move_cursor_down",
            ["<up>"] = "move_cursor_up",
            ["<C-p>"] = "move_cursor_up",
        },
    },
    filesystem = {
        use_libuv_file_watcher = true,
        follow_current_file = {
            enabled = true,
        },
        hijack_netrw_behavior = "open_current",
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_hidden = true,
        },
    },
}

return M
