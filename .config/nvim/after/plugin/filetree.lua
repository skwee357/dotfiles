require 'nvim-tree'.setup {
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
}
