-- local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")
telescope.load_extension("aerial")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				-- ["<c-t>"] = trouble.open_with_trouble,
				-- ["<C-h>"] = "which_key",
			},
			-- n = { ["<c-t>"] = trouble.open_with_trouble },
		},
	},
})
