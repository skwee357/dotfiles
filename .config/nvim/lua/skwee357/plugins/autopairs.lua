require'nvim-autopairs'.setup {
  disable_filetype = { "nerdtree" },
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" }
  }
}

