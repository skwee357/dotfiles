return {
    "sindrets/diffview.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        {
            "<leader>do",
            "<cmd>DiffviewOpen<cr>",
            desc = "DiffViewOpen",
        },
        {
            "<leader>dO",
            "<cmd>DiffviewOpen main...<cr>",
            desc = "DiffViewOpen (compare current branch with main)",
        },
        {
            "<leader>dc",
            "<cmd>tabclose<cr>",
            desc = "DiffViewClose",
        },
        {
            "<leader>de",
            "<cmd>DiffviewToggleFiles<cr>",
            desc = "DiffviewToggleFiles",
        },
        {
            "<leader>dr",
            "<cmd>DiffviewRefresh<cr>",
            desc = "Diffview Refresh",
        },
        {
            "<leader>dh",
            "<cmd>DiffviewFileHistory %<cr>",
            desc = "Diffview File History",
        },
        {
            "<leader>dH",
            "<cmd>DiffviewFileHistory<cr>",
            desc = "Diffview Entire File History",
        },
    },
}
