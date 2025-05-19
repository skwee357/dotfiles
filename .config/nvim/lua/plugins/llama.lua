return {
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
}
