local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Paste without replacing buffer
map("x", "<leader>P", "\"_dP", opts)
map("x", "<leader>p", "\"_dp", opts)

-- Remap up and down to also center the screen
map("n", "<C-d>", "<C-d>zz", { noremap = true })
map("n", "<C-u>", "<C-u>zz", { noremap = true })

-- When searching next or previous, also center the screen
map("n", "n", "nzzzv", { noremap = true })
map("n", "N", "Nzzzv", { noremap = true })

-- Buffers
map("n", "<C-x>", "<C-o> :bd #<CR>", opts)
-- map("n", "<C-c>", ":bp|bd #<CR>", opts)
map("n", "<A-h>", ":bprevious<CR>", opts)
map("n", "<A-l>", ":bnext<CR>", opts)
map("n", "<A-c>", ":bdelete<CR>", opts)

-- lsp
map("n", "K", ":lua vim.lsp.buf.hover()<CR>", { desc = "LSP Hover" })
map("n", "R", ":lua vim.lsp.buf.rename()<CR>", { desc = "LSP Rename" })
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", { desc = "LSP Code Actions" })
map("n", "<leader>lf", ":lua vim.lsp.buf.format()<CR>", { desc = "LSP Format Buffer" })
map("n", "<leader>D", ":lua vim.diagnostic.open_float()<CR>", { desc = "LSP Diagnostics" })
map("n", "[d", ":lua vim.diagnostic.goto_next()<CR>", { desc = "LSP Next Diagnostic" })
map("n", "]d", ":lua vim.diagnostic.goto_prev()<CR>", { desc = "LSP Previous Diagnostic" })
map("i", "<C-h>", ":lua vim.lsp.buf.signature_help()<CR>", { desc = "LSP Signature Help" })

-- Test runner
-- nmap      <silent>  <leader>tr    :lua require('neotest').run.run()<CR>
-- nmap      <silent>  <leader>T     :lua require('neotest').run.run(vim.fn.expand("%"))<CR>
-- nmap      <silent>  <leader>tx    :lua require('neotest').run.stop()<CR>
-- nmap      <silent>  <leader>ta    :lua require('neotest').run.attach()<CR>
-- nmap      <silent>  <leader>ts    :lua require('neotest').summary.toggle()<CR>
-- nmap      <silent>  <leader>to    :lua require('neotest').output.open()<CR>

-- Trouble
map("n", "<leader>xx", ":Trouble diagnostic toggle<CR>", opts)
map("n", "<leader>xX", ":Trouble diagnostic toggle filter.buf=0<CR>", opts)
map("n", "<leader>xt", ":Trouble todo toggle<CR>", opts)
map("n", "<leader>xT", ":Trouble todo toggle filter.buf=0<CR>", opts)

-- DAP
-- nnoremap <silent> <leader>db     :lua require('dap').toggle_breakpoint()<CR>
-- nnoremap <silent> <leader>dr     :lua require('dap').repl.open()<CR>
-- nnoremap <silent> <C-]>          :lua require('dap').continue()<CR>
-- nnoremap <silent> <C-8>          :lua require('dap').step_over()<CR>
-- nnoremap <silent> <C-7>          :lua require('dap').step_into()<CR>
-- nnoremap <silent> <C-9>          :lua require('dap').step_out()<CR>

-- Spectre
-- nnoremap <silent> <leader>S     :lua require('spectre').toggle()<CR>
-- nnoremap <silent> <leader>sw    :lua require('spectre').open_visual({select_word = true})<CR>
-- vnoremap <silent> <leader>sw    :lua require('spectre').open_visual()<CR>
-- nnoremap <silent> <leader>sp    :lua require('spectre').open_file_search({select_word = true})<CR>

-- nnoremap <silent> <leader>zen    :Goyo<CR>
