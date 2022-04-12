local gps = require'nvim-gps'
local c = require'onedark.colors'

local lsp = {
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    local active_clients = {}
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        if vim.lsp.buf_is_attached(0, client.id) then
          -- return client.name
          table.insert(active_clients, client.name)
        end
      end
    end
    return table.concat(active_clients, ",")
  end,
  icon = ' ',
  color = {fg = c.yellow}
}

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {'vim-plug', 'Outline'},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {{'branch', icon = '', color = { fg = c.purple }}, 'diff'},
    lualine_c = {{'filename', path = 0, symbols = {modified = ' ', readonly = ' ', unnamed = '[No Name]'}}, {gps.get_location, cond = gps.is_available}},
    lualine_x = {lsp, 'diagnostics', {'filetype', colored = true, icon_only = false}, 'encoding', {'fileformat', icons_enabled = true}},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fzf', 'nvim-tree', 'fugitive', 'symbols-outline'}
}
