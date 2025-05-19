return {
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
}
