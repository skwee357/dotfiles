require("lspconfig")

local servers = {
    "cssls",
    "eslint",
    "html",
    "jsonls",
    "pyright",
    "tailwindcss",
    "ltex",
    "beancount",
    "lua_ls",
    "ruby_lsp",
    "rust_analyzer"
}

vim.lsp.enable(servers)
