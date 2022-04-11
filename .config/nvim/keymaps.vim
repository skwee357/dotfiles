let mapleader = ';'

nnoremap <C-p>      :Files<CR>

nnoremap <leader>y  :Buffers<CR>
nnoremap <leader>u  :UndotreeToggle<CR>
nnoremap <leader>e  :NvimTreeToggle<CR>
nnoremap <leader>F  :Rg<CR>
nnoremap <leader>so :SymbolsOutline<CR>

" Buffers
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
nnoremap <silent>    <A-p> :BufferPin<CR>
nnoremap <silent>    <A-c> :BufferClose<CR>
nnoremap <silent>    <C-s> :BufferPick<CR>

" LSP
nnoremap gD     <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap gd     <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap K      <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gi     <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap gr     <cmd>lua vim.lsp.buf.references()<CR>
nnoremap ca     <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap R      <cmd>lua vim.lsp.buf.rename()<CR>
inoremap <C-h>  <cmd>lua vim.lsp.buf.signature_help()<CR>

" Trouble
nnoremap <leader>xx     :TroubleToggle<CR>
nnoremap <leader>xd     :TroubleToggle document_diagnostics<CR>
nnoremap <leader>xw     :TroubleToggle workspace_diagnostics<CR>
nnoremap <leader>xq     :TroubleToggle quickfix<CR>

" Remove all trailing whitespaces
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
