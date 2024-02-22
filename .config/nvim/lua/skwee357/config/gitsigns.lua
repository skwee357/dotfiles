require 'gitsigns'.setup {
  signs                        = {
    add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
    change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
  },
  signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir                 = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked          = true,
  current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts      = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority                = 6,
  update_debounce              = 100,
  status_formatter             = nil, -- Use default
  max_file_length              = 40000,
  preview_config               = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm                         = {
    enable = true
  },
  on_attach                    = function(bufnr)
    local gs = package.loaded.gitsigns

    vim.keymap.set('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return '<Ignore>'
    end, { buffer = bufnr, expr = true })

    vim.keymap.set('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return '<Ignore>'
    end, { buffer = bufnr, expr = true })

    vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { buffer = bufnr })
    vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { buffer = bufnr })
    vim.keymap.set('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
      { buffer = bufnr })
    vim.keymap.set('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
      { buffer = bufnr })
    vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, { buffer = bufnr })
    vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { buffer = bufnr })
    vim.keymap.set('n', '<leader>hS', gs.stage_buffer, { buffer = bufnr })
    vim.keymap.set('n', '<leader>hR', gs.reset_buffer, { buffer = bufnr })
    vim.keymap.set('n', '<leader>hb', function() gs.blame_line { full = true } end, { buffer = bufnr })
    vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame, { buffer = bufnr })
    vim.keymap.set('n', '<leader>hd', gs.diffthis, { buffer = bufnr })
    vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end, { buffer = bufnr })
    vim.keymap.set('n', '<leader>td', gs.toggle_deleted, { buffer = bufnr })
  end
}
