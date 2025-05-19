return {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("onedark").setup({
            style = "dark",
            toggle_style_key = "<NOP>",
            highlights = {
                LspSignatureActiveParameter = { fg = "$yellow" },
                WinBar = { fg = "$fg", bg = "NONE" },
                WinBarNC = { fg = "$fg", bg = "NONE" },
                LualineLspIcon = { fg = "$yellow", bg = "$bg1" }
            }
        })

        require("onedark").load()
    end,
}
