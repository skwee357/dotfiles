let mapleader = ';'

nnoremap <C-p> :Files<CR>
nnoremap <leader>y :Buffers<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>e :NvimTreeToggle<CR>
nnoremap <leader>F :Rg<CR>

" Remove all trailing whitespaces
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
