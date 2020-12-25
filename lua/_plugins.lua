vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'gruvbox-community/gruvbox'
end)
