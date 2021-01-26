local remap = vim.api.nvim_set_keymap

remap('n','<C-t><C-t>', '<cmd>BufferLinePick<CR>', { noremap = true, silent = true })
remap('n','<C-t>l', '<cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true })
remap('n','<C-t>h', '<cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true })
remap('n','<C-t><C-p>', '<cmd>bw<CR>', { noremap = true, silent = true })
