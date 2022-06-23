let mapleader = ' '

silent! !git rev-parse --is-inside-work-tree
if v:shell_error == 0
  nnoremap <silent> <C-p>      :FzfLua git_files<CR>
  nnoremap <silent> <leader>gs :FzfLua git_status<CR>
else
  nnoremap <silent> <C-p>      :FzfLua files<CR>
endif

nnoremap <silent> <leader>b :FzfLua buffers<CR>
" nnoremap <leader>/  :RG<CR>
nnoremap <silent> <leader>f  :FzfLua live_grep_resume<CR>
nnoremap <silent> <leader>F  :FzfLua grep_cword<CR>

nnoremap <silent> <leader>u  :UndotreeToggle<CR>
nnoremap <silent> <leader>e  :NvimTreeToggle<CR>
nnoremap <silent> <leader>so :SymbolsOutline<CR>

" Buffers
nnoremap <silent>    <A-h> :BufferPrevious<CR>
nnoremap <silent>    <A-l> :BufferNext<CR>
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
nnoremap <silent>    <A-s> :BufferPick<CR>

" Git
nnoremap <silent> <leader>gg  :LazyGit<CR>

" Gitsigns
nnoremap <silent> <leader>hs  :Gitsigns stage_hunk<CR>
nnoremap <silent> <leader>hr  :Gitsigns reset_hunk<CR>
nnoremap <silent> <leader>hu  :Gitsigns undo_stage_hunk<CR>
nnoremap <silent> <leader>tb  :Gitsigns toggle_current_line_blame<CR>

" LSP
nnoremap <silent> gD          :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd          :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi          :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr          :lua vim.lsp.buf.references()<CR>

nnoremap <silent> K           :lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> R           :lua vim.lsp.buf.rename()<CR>
nnoremap <silent> R           :lua require('renamer').rename()<CR>

nnoremap <silent> <leader>ca  :lua vim.lsp.buf.code_action()<CR>

nnoremap <silent> <leader>lf  :lua vim.lsp.buf.formatting_sync()<CR>

nnoremap <silent> <leader>D   :lua vim.diagnostic.open_float()<CR>
nnoremap <silent> [d          :lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> ]d          :lua vim.diagnostic.goto_prev()<CR>

inoremap <silent> <C-h>       <cmd>lua vim.lsp.buf.signature_help()<CR>

" Test Runner
nmap      <silent>  <leader>t     :lua require('neotest').run.run()<CR>
nmap      <silent>  <leader>T     :lua require('neotest').run.run(vim.fn.expand("%"))<CR>
nmap      <silent>  <leader>tx    :lua require('neotest').run.stop()<CR>
nmap      <silent>  <leader>ta    :lua require('neotest').run.attach()<CR>
nmap      <silent>  <leader>ts    :lua require('neotest').summary.toggle()<CR>
nmap      <silent>  <leader>to    :lua require('neotest').output.open()<CR>

" Trouble
nnoremap <silent> <leader>xx     :TroubleToggle<CR>
nnoremap <silent> <leader>xd     :TroubleToggle document_diagnostics<CR>
nnoremap <silent> <leader>xw     :TroubleToggle workspace_diagnostics<CR>
nnoremap <silent> <leader>xq     :TroubleToggle quickfix<CR>
nnoremap <silent> <leader>xt     :TodoTrouble<CR>

" Remove all trailing whitespaces
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

