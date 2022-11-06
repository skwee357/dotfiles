" autocmd BufWritePre * :%s/\s\+$//e

" Format on save
" autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync()
" autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync()
" autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync()
" autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync()
autocmd BufWritePre *.rs lua vim.lsp.buf.format()
autocmd BufWritePre *.dart lua vim.lsp.buf.format()

" autocmd FileType nerdtree setlocal signcolumn=no
autocmd FileType undotree setlocal signcolumn=no

" Highlight line under cursor only in active window / buffer
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 150})
augroup END

function DetectGoHtmlTmpl()
    if expand('%:e') == "html" && search("{{") != 0
        set filetype=gohtmltmpl
    endif
endfunction

augroup filetypedetect
    au! BufRead,BufNewFile *.html call DetectGoHtmlTmpl()
    au! BufRead,BufNewFile *.wgsl set filetype=wgsl
augroup END
