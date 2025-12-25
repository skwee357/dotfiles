return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = false, auto_close = true },
        indent = { enabled = true },
        input = { enabled = true },
        picker = {
            enabled = true,
            sources = {
                explorer = {
                    auto_close = true
                }
            }
        },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
    keys = {
        -- Top pickers and explorers
        { "<C-p>",      function() Snacks.picker.files() end,                 desc = "Find Files" },
        { "<leader>,",  function() Snacks.picker.buffers() end,               desc = "Buffers" },
        { "<leader>/",  function() Snacks.picker.grep() end,                  desc = "Grep" },
        { "<leader>n",  function() Snacks.picker.notifications() end,         desc = "Notification History" },
        -- { "<leader>e",  function() Snacks.explorer() end,                     desc = "Explorer" },

        -- git
        { "<leader>gb", function() Snacks.picker.git_branches() end,          desc = "Git Branches" },
        { "<leader>gl", function() Snacks.picker.git_log() end,               desc = "Git Log" },
        { "<leader>gL", function() Snacks.picker.git_log_line() end,          desc = "Git Log Line" },
        { "<leader>gs", function() Snacks.picker.git_status() end,            desc = "Git Status" },
        { "<leader>gS", function() Snacks.picker.git_stash() end,             desc = "Git Stash" },
        { "<leader>gd", function() Snacks.picker.git_diff() end,              desc = "Git Diff (Hunks)" },
        { "<leader>gf", function() Snacks.picker.git_log_file() end,          desc = "Git Log File" },

        -- search
        { "<leader>s/", function() Snacks.picker.search_history() end,        desc = "Search History" },
        { "<leader>sd", function() Snacks.picker.diagnostics() end,           desc = "Diagnostics" },
        { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end,    desc = "Buffer Diagnostics" },
        { "<leader>sH", function() Snacks.picker.highlights() end,            desc = "Highlights" },
        { "<leader>sj", function() Snacks.picker.jumps() end,                 desc = "Jumps" },
        { "<leader>sq", function() Snacks.picker.qflist() end,                desc = "Quickfix List" },
        { "<leader>sR", function() Snacks.picker.resume() end,                desc = "Resume" },
        { "<leader>su", function() Snacks.picker.undo() end,                  desc = "Undo History" },

        -- lsp
        { "gd",         function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
        { "gD",         function() Snacks.picker.lsp_declarations() end,      desc = "Goto Declaration" },
        { "gr",         function() Snacks.picker.lsp_references() end,        nowait = true,                  desc = "References" },
        { "gI",         function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
        { "gy",         function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
        { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

        -- other
        { "<leader>n",  function() Snacks.notifier.show_history() end,        desc = "Notification History" },
        { "<leader>gg", function() Snacks.lazygit() end,                      desc = "Lazygit" },
        { "<C-c>",      function() Snacks.bufdelete() end,                    desc = "Delete Buffer" },
    }
}
