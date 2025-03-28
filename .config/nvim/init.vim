source ~/.config/nvim/keymaps.vim

syntax enable
filetype plugin indent on

highlight Normal guibg=NONE ctermbg=NONE

let $FZF_DEFAULT_COMMAND = "fd --type file --color=always --hidden"

let g:loaded_perl_provider = 0

lua require('skwee357')

highlight WinBar guibg=NONE
highlight WinBarNC guibg=NONE
