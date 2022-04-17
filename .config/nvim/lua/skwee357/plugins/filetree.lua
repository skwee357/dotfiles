require'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  view = {
    side = "left"
  },
  actions = {
    open_file = {
      quit_on_open = true,
      resize_window = true
    }
  }
}
