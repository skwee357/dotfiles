require 'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  view = {
    side = "left",
    width = 30
  },
  actions = {
    open_file = {
      quit_on_open = true,
      resize_window = true
    }
  },
  update_focused_file = {
    enable = true
  },
  renderer = {
    highlight_opened_files = "3"
  }
}

local events = require 'nvim-tree.events'
local buf_line_state = require 'bufferline.api'

events.on_tree_open(function()
  buf_line_state.set_offset(31, 'FileTree')
end)

events.on_tree_close(function()
  buf_line_state.set_offset(0)
end)
