return {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
        auto_save = true,
        auto_restore = true,
        suppressed_dirs = { "~/", "~/Documents", "~/Downloads", "/" },
        bypass_save_filetypes = { "alpha", "netrw" }
    }
}
