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
    }
}
