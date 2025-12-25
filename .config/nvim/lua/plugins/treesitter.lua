return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        branch = "main",
        event = "BufRead",
        ---@class TSConfig
        opts = {
            ensure_installed = {
                "astro",
                "bash",
                "c",
                "css",
                "diff",
                "go",
                "gomod",
                "gowork",
                "gosum",
                "graphql",
                "html",
                "javascript",
                "jsdoc",
                "json",
                "jsonc",
                "json5",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "toml",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
                "ruby",
                "rust",
                "beancount"
            },
        },
        config = function(_, opts)
            ts_install = function(buf, parser)
                vim.treesitter.start(buf, parser)
                vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end

            -- install parsers from custom opts.ensure_installed
            if opts.ensure_installed and #opts.ensure_installed > 0 then
                require("nvim-treesitter").install(opts.ensure_installed)
                -- register and start parsers for filetypes
                for _, parser in ipairs(opts.ensure_installed) do
                    local filetypes = parser -- In this case, parser is the filetype/language name
                    vim.treesitter.language.register(parser, filetypes)

                    vim.api.nvim_create_autocmd({ "FileType" }, {
                        pattern = filetypes,
                        callback = function(event)
                            ts_install(event.buf, parser)
                        end,
                    })
                end
            end

            -- Auto-install and start parsers for any buffer
            vim.api.nvim_create_autocmd({ "BufRead" }, {
                callback = function(event)
                    local bufnr = event.buf
                    local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })

                    -- Skip if no filetype
                    if filetype == "" then
                        return
                    end

                    -- Check if this filetype is already handled by explicit opts.ensure_installed config
                    for _, filetypes in pairs(opts.ensure_installed) do
                        local ft_table = type(filetypes) == "table" and filetypes or { filetypes }
                        if vim.tbl_contains(ft_table, filetype) then
                            return -- Already handled above
                        end
                    end

                    -- Get parser name based on filetype
                    local parser_name = vim.treesitter.language.get_lang(filetype) -- might return filetype (not helpful)
                    if not parser_name then
                        return
                    end
                    -- Try to get existing parser (helpful check if filetype was returned above)
                    local parser_configs = require("nvim-treesitter.parsers")
                    if not parser_configs[parser_name] then
                        return -- Parser not available, skip silently
                    end

                    local parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

                    if not parser_installed then
                        -- If not installed, install parser synchronously
                        require("nvim-treesitter").install({ parser_name }):wait(30000)
                    end

                    -- let's check again
                    parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

                    if parser_installed then
                        -- Start treesitter for this buffer
                        ts_install(bufnr, parser_name)
                    end
                end,
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        keys = {
            {
                "af",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
                end,
                desc = "Select outer function",
                mode = { "x", "o" },
            },
            {
                "if",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
                end,
                desc = "Select inner function",
                mode = { "x", "o" },
            },
            {
                "ac",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
                end,
                desc = "Select outer class",
                mode = { "x", "o" },
            },
            {
                "ic",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
                end,
                desc = "Select inner class",
                mode = { "x", "o" },
            },
            {
                "as",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
                end,
                desc = "Select local scope",
                mode = { "x", "o" },
            },
        },
        ---@module "nvim-treesitter-textobjects"
        opts = { multiwindow = true },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufRead",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            event = "BufRead",
        },
        opts = {
            multiwindow = true,
        },
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup({
                enable = true,
                filetypes = {
                    "html",
                    "handlebars",
                    "jinja",
                },
                opts = {
                    -- Defaults
                    enable_close = true,          -- Auto close tags
                    enable_rename = true,         -- Auto rename pairs of tags
                    enable_close_on_slash = false -- Auto close on trailing </
                },
            })
        end
    },
    -- {
    --     "JoosepAlviste/nvim-ts-context-commentstring",
    --     init = function()
    --         -- HACK: add workaround for native comments: https://github.com/JoosepAlviste/nvim-ts-context-commentstring/issues/109
    --         vim.schedule(function()
    --             local get_option = vim.filetype.get_option
    --             local context_commentstring
    --             vim.filetype.get_option = function(filetype, option)
    --                 if option ~= "commentstring" then return get_option(filetype, option) end
    --                 if context_commentstring == nil then
    --                     local ts_context_avail, ts_context = pcall(require, "ts_context_commentstring.internal")
    --                     context_commentstring = ts_context_avail and ts_context
    --                 end
    --                 return context_commentstring and context_commentstring.calculate_commentstring() or
    --                 get_option(filetype, option)
    --             end
    --         end)
    --     end,
    --     config = function()
    --         require("ts_context_commentstring").setup({
    --             enable_autocmd = false,
    --         })
    --     end
    -- },
}
