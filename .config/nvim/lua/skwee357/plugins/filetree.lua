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
-- local buf_line_state = require 'bufferline.api'

events.on_tree_open(function()
--  buf_line_state.set_offset(31, 'FileTree')
end)

events.on_tree_close(function()
--  buf_line_state.set_offset(0)
end)
