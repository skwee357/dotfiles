return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-prose"
    },
    config = function()
        -- local c = require("onedark.colors")
        -- local c = require("tokyonight.colors").setup()
        local prose = require("nvim-prose")
        local lsp = {
            function()
                local msg = 'No Active Lsp'
                local buf_ft = vim.bo[0].filetype
                local clients = vim.lsp.get_clients()
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
            icon = " ",
            -- color = "LualineLspIcon"
        }

        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                -- component_separators = '',
                -- section_separators = '',
                disabled_filetypes = { 'vim-plug', 'Outline' },
                always_divide_middle = true,
                globalstatus = true,
            },
            sections = {
                lualine_a = { 'mode' },
                -- lualine_b = { { 'branch', icon = '', color = { fg = c.cyan } }, 'diff' },
                lualine_b = { { 'branch', icon = '', }, 'diff' },
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                        symbols = { modified = ' ', readonly = ' ', unnamed = '[No Name]', newfile = '[New]' }
                    },
                },
                lualine_x = {
                    { 'diagnostics',      always_visible = true },
                    lsp,
                    { prose.word_count,   cond = prose.is_available },
                    { prose.reading_time, cond = prose.is_available },
                    { 'filetype',         colored = true,           icon_only = false },
                    'encoding',
                    { 'fileformat', icons_enabled = false } },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            -- winbar = {
            --     lualine_a = {},
            --     lualine_b = {},
            --     lualine_c = {
            --         -- { 'filename', path = 1, color = { bg = 'NONE' } },
            --         -- {
            --         --     'navic',
            --         --     color_correction = 'static',
            --         --     navic_opts = nil,
            --         --     color = { bg = 'NONE' }
            --         -- }
            --     },
            --     lualine_x = {},
            --     lualine_y = {},
            --     lualine_z = {}
            -- },
            -- inactive_winbar = {
            --     lualine_a = {},
            --     lualine_b = {},
            --     lualine_c = {
            --         { 'filename', path = 1 },
            --     },
            --     lualine_x = {},
            --     lualine_y = {},
            --     lualine_z = {}
            -- },
            tabline = {
                -- lualine_a = { { "buffers", mode = 2, max_length = vim.o.columns } }
            },
            extensions = { 'fzf', 'nvim-tree', 'nvim-dap-ui' }
        })
    end
}
