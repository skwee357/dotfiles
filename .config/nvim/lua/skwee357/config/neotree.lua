local M = {
    close_if_last_window = true,
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
    },
}

return M
