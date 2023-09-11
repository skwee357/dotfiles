require 'obsidian'.setup {
    dir = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault",
    daily_notes = {
        folder = "10 Review/Daily",
        date_format = "YYYY/MM-MMM/YYYY-MM-DD"
    },
    completion = {
        nvim_cmp = true,
        min_chars = 2,
        new_notes_location = "current_dir",
        prepend_note_id = true
    },
    templates = {
        subdir = "999 templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
    },
    finder = "fzf-lua",
    open_notes_in = "current"
}
