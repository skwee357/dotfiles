source ~/.config/nvim/options.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/keymaps.vim

autocmd FileType nerdtree setlocal signcolumn=no
autocmd FileType undotree setlocal signcolumn=no

lua require('init')
