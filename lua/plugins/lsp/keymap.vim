inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <silent>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>K  <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent><Space>rn  <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent><Space>ca    <cmd>lua vim.lsp.buf.code_action()<cr>
