local map = vim.api.nvim_set_keymap

map('n', '<Space>cf', '<cmd>Clap files<cr>', { noremap = true, silent = true })
map('n', '<Space>cg', '<cmd>Clap grep<cr>', { noremap = true, silent = true })
