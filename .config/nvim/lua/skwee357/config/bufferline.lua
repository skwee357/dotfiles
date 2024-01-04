local M = {
    options = {
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                text_align = 'left',
                separator = true
            }
        },
        show_buffer_close_icons = false,
        get_element_icon = function(element)
            local icon, hl = require("nvim-web-devicons").get_icon_by_filetype(element.filetype,
                { default = false })
            return icon, hl
        end,
        show_close_icon = false,
    }
}

return M
