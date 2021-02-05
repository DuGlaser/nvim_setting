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
