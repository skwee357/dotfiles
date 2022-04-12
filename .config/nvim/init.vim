source ~/.config/nvim/options.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/keymaps.vim

lua require('init')

" autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 100)
