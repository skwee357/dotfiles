require'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  actions = {
    open_file = {
      quit_on_open = true
    }
  }
}
