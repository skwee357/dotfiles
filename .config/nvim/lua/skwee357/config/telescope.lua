-- local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")
local actions = require("telescope.actions");

telescope.load_extension("aerial")
telescope.load_extension("live_grep_args")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.cycle_history_next,
				["<C-k>"] = actions.cycle_history_prev,
				-- ["<c-t>"] = trouble.open_with_trouble,
				-- ["<C-h>"] = "which_key",
			},
			-- n = { ["<c-t>"] = trouble.open_with_trouble },
		},
	},
	pickers = {
		find_files = {
			find_command = { "fd", "--type", "file", "--hidden" }
		}
	}
})
