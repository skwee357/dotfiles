local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

create_new_file = function()
    local filename = vim.fn.input("Enter the filename: ")
    if filename ~= "" then
        vim.cmd("edit " .. filename)
    end
end

-- Set header
dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button("e", "  > New file", ":lua create_new_file()<CR>"),
    dashboard.button("f", "  > Find file in git repo", ":FzfLua git_files<CR>"),
    dashboard.button("r", "  > Recent", ":FzfLua oldfiles<CR>"),
    dashboard.button("l", "󰁒  > Open last session", ":SessionManager load_last_session<CR>"),
    dashboard.button("o", "  > Open session", ":SessionManager load_session<CR>"),
    dashboard.button("s", "  > Settings", ":e $HOME/.config/nvim | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    --    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

local fortune = require("alpha.fortune")
dashboard.section.footer.val = fortune()

-- Send config to alpha
alpha.setup(dashboard.opts)
