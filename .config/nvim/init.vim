source ~/.config/nvim/plugins.vim
source ~/.config/nvim/keymaps.vim

syntax on

highlight Normal guibg=NONE ctermbg=NONE

" change cursor to line in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

let $FZF_DEFAULT_COMMAND = "fd --type file --color=always --hidden"

let g:markdown_fenced_languages = ['toml', 'html', 'python', 'javascript', 'typescript']

let g:loaded_perl_provider = 0

lua require('skwee357')

