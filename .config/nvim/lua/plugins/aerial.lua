return {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require('aerial').setup({
            layout = {
                max_width = { 40, 0.3 },
                width = 40,
                min_width = 40
            }
        })
    end
}
