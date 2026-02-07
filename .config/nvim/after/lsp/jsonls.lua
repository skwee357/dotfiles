return {
    filetypes = { "json", "jsonc" },
    settings = {
        json = {
            schemas = require 'schemastore'.json.schemas(),
            validate = { enable = true },
            format = { enable = false }
        }
    },
    init_options = {
        provideFormatter = false
    }
}
