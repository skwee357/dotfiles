let mapleader = ' '

silent! !git rev-parse --is-inside-work-tree
if v:shell_error == 0
  " nnoremap <silent> <C-p>      :FzfLua git_files<CR>
  nnoremap <silent> <C-p>      :Telescope git_files<CR>
  " nnoremap <silent> <leader>gs :FzfLua git_status<CR>
  " nnoremap <silent> <C-f>      :FzfLua files<CR>
  nnoremap <silent> <C-f>      :Telescope find_files<CR>
else
  " nnoremap <silent> <C-p>      :FzfLua files<CR>
  nnoremap <silent> <C-p>      :Telescope find_files<CR>
endif

" Remap up and down to also center the screen
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" When searching next or previous, also center the screen
nnoremap n nzzzv
nnoremap N Nzzzv

" nnoremap <silent> <leader>bb :FzfLua buffers<CR>
nnoremap <silent> <leader>bb :Telescope buffers<CR>
" nnoremap <silent> <leader>f  :FzfLua live_grep_resume<CR>
nnoremap <silent> <leader>f  :Telescope live_grep<CR>
" nnoremap <silent> <leader>F  :FzfLua grep_cword<CR>
nnoremap <silent> <leader>F  :Telescope grep_string<CR>
" nnoremap <silent> <leader>bf :FzfLua lgrep_curbuf<CR>

nnoremap <silent> <leader>u  :UndotreeToggle<CR>
nnoremap <silent> <leader>e  :NvimTreeToggle<CR>
nnoremap <silent> <leader>so :SymbolsOutline<CR>

" Paste without replacing buffer
xnoremap <silent> <leader>p  "_dP

" Buffers
" nnoremap <silent>    <A-h> :BufferPrevious<CR>
" nnoremap <silent>    <A-l> :BufferNext<CR>
" nnoremap <silent>    <A-1> :BufferGoto 1<CR>
" nnoremap <silent>    <A-2> :BufferGoto 2<CR>
" nnoremap <silent>    <A-3> :BufferGoto 3<CR>
" nnoremap <silent>    <A-4> :BufferGoto 4<CR>
" nnoremap <silent>    <A-5> :BufferGoto 5<CR>
" nnoremap <silent>    <A-6> :BufferGoto 6<CR>
" nnoremap <silent>    <A-7> :BufferGoto 7<CR>
" nnoremap <silent>    <A-8> :BufferGoto 8<CR>
" nnoremap <silent>    <A-9> :BufferLast<CR>
" nnoremap <silent>    <A-p> :BufferPin<CR>
" nnoremap <silent>    <A-c> :BufferClose<CR>
" nnoremap <silent>    <A-s> :BufferPick<CR>

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
" nnoremap <silent> gp          :Lspsaga peek_definition<CR>
nnoremap <silent> gi          :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr          :lua vim.lsp.buf.references()<CR>
" nnoremap <silent> gr          :FzfLua lsp_references<CR>
" nnoremap <silent> gr          :Telescope lsp_references<CR>
" nnoremap <silent> gh          :Lspsaga lsp_finder<CR>
" nnoremap <silent> gh          :FzfLua lsp_definitions<CR>
" nnoremap <silent> gh          :Telescope lsp_definitions<CR>

" nnoremap <silent> <leader>sf  :FzfLua lsp_live_workspace_symbols<CR>
nnoremap <silent> <leader>sf  :Telescope lsp_dynamic_workspace_symbols<CR>

nnoremap <silent> K           :lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> K           :Lspsaga hover_doc<CR>
nnoremap <silent> R           :lua vim.lsp.buf.rename()<CR>
" nnoremap <silent> R           :Lspsaga rename<CR>

nnoremap <silent> <leader>ca  :lua vim.lsp.buf.code_action()<CR>
" nnoremap <silent> <leader>ca  :Lspsaga code_action<CR>
" nnoremap <silent> <leader>ca  :FzfLua lsp_code_actions<CR>

nnoremap <silent> <leader>lf  :lua vim.lsp.buf.format()<CR>

nnoremap <silent> <leader>D   :lua vim.diagnostic.open_float()<CR>
" nnoremap <silent> <leader>dw  :FzfLua lsp_workspace_diagnostics<CR>
nnoremap <silent> <leader>dw  :Telescope diagnostics<CR>
" nnoremap <silent> <leader>dd  :FzfLua lsp_document_diagnostics<CR>
nnoremap <silent> <leader>dd  :Telescope diagnostics bufnr=0<CR>
nnoremap <silent> [d          :lua vim.diagnostic.goto_next()<CR>
" nnoremap <silent> [d          :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]d          :lua vim.diagnostic.goto_prev()<CR>
" nnoremap <silent> ]d          :Lspsaga diagnostic_jump_prev<CR>

inoremap <silent> <C-h>       :lua vim.lsp.buf.signature_help()<CR>

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

