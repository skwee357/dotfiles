-- local extension_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
-- local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/'
-- local codelldb_path = extension_path .. 'adapter/codelldb'
-- local liblldb_path = extension_path .. 'lldb/lib/liblldb'
-- local this_os = vim.uv.os_uname().sysname;

-- The path is different on Windows
-- if this_os:find "Windows" then
--     codelldb_path = extension_path .. "adapter\\codelldb.exe"
--     liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
-- else
--     -- The liblldb extension is .so for Linux and .dylib for MacOS
--     liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
-- end

-- local cfg = require('rustaceanvim.config')

vim.g.rustaceanvim = {
    tools = {
        executor = require('rustaceanvim.executors').termopen,
        reload_workspace_from_cargo_toml = true,
        hover_actions = {
            auto_focus = true,
        },
    },
    server = {
        on_attach = function(client, bufnr)
            require("skwee357.lsp").common_on_attach(client, bufnr)
        end,
        capabilities = require("skwee357.lsp").common_capabilities(),
        default_settings = {
            ['rust-analyzer'] = {
                lens = {
                    enable = true
                },
                checkOnSave = {
                    enable = true,
                    command = 'clippy'
                }
            }
        }
    }
};

-- require 'rust-tools'.setup {
--     tools = {
--         on_initialized = function()
--             vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
--                 pattern = { "*.rs" },
--                 callback = function()
--                     local _, _ = pcall(vim.lsp.codelens.refresh)
--                 end,
--             })
--         end,
--     },
-- }
