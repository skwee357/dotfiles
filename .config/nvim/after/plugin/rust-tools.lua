local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")

local codelldb_path = mason_path .. "bin/codelldb"
local liblldb_path = mason_path .. "packages/codelldb/extension/lldb/lib/liblldb"
local this_os = vim.loop.os_uname().sysname

-- The path in windows is different
if this_os:find "Windows" then
    codelldb_path = mason_path .. "packages\\codelldb\\extension\\adapter\\codelldb.exe"
    liblldb_path = mason_path .. "packages\\codelldb\\extension\\lldb\\bin\\liblldb.dll"
else
    -- The liblldb extension is .so for linux and .dylib for macOS
    liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
end

require 'rust-tools'.setup {
    tools = {
        executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
        reload_workspace_from_cargo_toml = true,
        inlay_hints = {
            auto = true,
            only_current_line = false,
            show_parameter_hints = false,
            parameter_hints_prefix = "<-",
            other_hints_prefix = "=>",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = "Comment",
        },
        hover_actions = {
            border = "rounded",
        },
        on_initialized = function()
            vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
                pattern = { "*.rs" },
                callback = function()
                    local _, _ = pcall(vim.lsp.codelens.refresh)
                end,
            })
        end,
    },
    dap = {
        -- adapter= codelldb_adapter,
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    server = {
        on_attach = function(client, bufnr)
            require('skwee357.lsp').common_on_attach(client, bufnr)
        end,
        capabilities = require('skwee357.lsp').common_capabilities(),
        settings = {
            ["rust-analyzer"] = {
                lens = {
                    enable = true,
                },
                checkOnSave = {
                    enable = true,
                    command = "clippy",
                },
            },
        },
    },
}
