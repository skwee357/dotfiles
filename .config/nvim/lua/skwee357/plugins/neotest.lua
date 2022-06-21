require 'neotest'.setup {
  adapter = {
    require('neotest-jest'),
    -- require('neotest-vim-test')({
    --   ignore_file_types = { "typescript", "javascript" }
    -- })
  },
  diagnostic = {
    enabled = true
  },
  status = {
    enabled = true
  }
}
