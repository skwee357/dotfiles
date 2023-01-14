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

local events = require 'nvim-tree.events'

events.on_tree_open(function()
end)

events.on_tree_close(function()
end)
