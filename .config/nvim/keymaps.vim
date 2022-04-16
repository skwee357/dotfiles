let mapleader = ' '

nnoremap <C-p>      :Files<CR>

nnoremap <leader>y  :Buffers<CR>
nnoremap <leader>u  :UndotreeToggle<CR>
nnoremap <leader>e  :NvimTreeToggle<CR>
nnoremap <leader>F  :RG<CR>
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
nnoremap <silent> gD          :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd          :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gpd         :lua require('goto-preview').goto_preview_definition()<CR>
nnoremap <silent> K           :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi          :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gpi         :lua require('goto-preview').goto_preview_implementation()<CR>
nnoremap <silent> gpx         :lua require('goto-preview').close_all_win()<CR>
nnoremap <silent> gr          :lua vim.lsp.buf.references()<CR>
nnoremap <silent> ca          :lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> R           :lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>f   :lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> [g          :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> ]g          :lua vim.lsp.diagnostic.goto_prev()<CR>
inoremap <silent> <C-h>       :lua vim.lsp.buf.signature_help()<CR>

" Trouble
nnoremap <silent> <leader>xx     :TroubleToggle<CR>
nnoremap <silent> <leader>xd     :TroubleToggle document_diagnostics<CR>
nnoremap <silent> <leader>xw     :TroubleToggle workspace_diagnostics<CR>
nnoremap <silent> <leader>xq     :TroubleToggle quickfix<CR>

" Remove all trailing whitespaces
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

