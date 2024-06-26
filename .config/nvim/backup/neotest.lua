require 'neotest'.setup {
    adapter = {
        require('neotest-jest')({
            jestCommand = 'npm test --',
            jestConfigFile = 'jest.config.js',
            cwd = function(path)
                return vim.fn.getcwd()
            end
        }),
        -- require('neotest-vim-test')({
        --   ignore_file_types = { "typescript", "javascript" }
        -- })
    },
    diagnostic = {
        enabled = true
    },
    status = {
        enabled = true
    },
    summary = {
        animated = true,
        follow = true,
        enabled = true,
        expand_errors = true,
        mappings = {
            attach = "a",
            clear_marked = "M",
            clear_target = "T",
            debug = "d",
            debug_marked = "D",
            expand = { "<CR>", "<2-LeftMouse>" },
            expand_all = "e",
            help = "?",
            jumpto = "i",
            mark = "m",
            next_failed = "J",
            output = "o",
            prev_failed = "K",
            run = "r",
            run_marked = "R",
            short = "O",
            stop = "u",
            target = "t",
            watch = "w"
        },
        open = "botright split | resize 25"
    }
}
