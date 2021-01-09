local nvim_lsp = require'lspconfig'
local on_attach = function(client)
  -- require'diagnostic'.on_attach()
  require'completion'.on_attach()
end

nvim_lsp.tsserver.setup{}
nvim_lsp.gopls.setup{}
nvim_lsp.html.setup{}
nvim_lsp.cssls.setup{}
nvim_lsp.jsonls.setup{}
nvim_lsp.rust_analyzer.setup{}

vim.g.completion_enable_snippet = 'UltiSnips'

vim.cmd('set shortmess+=c')
vim.cmd('set completeopt=menuone,noinsert')
vim.cmd('set updatetime=500')
vim.cmd("autocmd BufEnter * lua require'completion'.on_attach()")

vim.g.completion_chain_complete_list = {
    {
        complete_items = {"lsp", "snippet", "buffers"}
    }
}

vim.g.completion_items_priority = {
    Field = 5,
    Function = 7,
    Variables = 7,
    Method = 10,
    Module = 7,
    Interfaces = 5,
    Constant = 5,
    Class = 5,
    Keyword = 4,
    UltiSnips = 10,
    Buffers = 1,
    TabNine = 9,
    File = 0
}
