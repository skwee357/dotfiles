require("codecompanion").setup({
    strategies = {
        chat = {
            adapter = "qwen"
        },
        inline = {
            adapter = "qwen"
        }
    },
    adapters = {
        qwen = require("codecompanion.adapters").extend("ollama", {
            name = "qwen",
            schema = {
                model = {
                    default = "qwen2.5-coder:7b"
                }
            }
        })
    },
    display = {
        action_palette = {
            provider = "telescope"
        },
        chat = {
            window = {
                layout = "float",
                height = 0.7,
                width = 0.8
            }
        },
        diff = {
            provider = "mini_diff"
        }
    },
    opts = {
        log_level = "TRACE"
    }
})
