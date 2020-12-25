local remap = vim.api.nvim_set_keymap

remap('n', ';', ':', { noremap = true})
remap('n', 's', '<Nop>', { noremap = true})
remap('x', 's', '<Nop>', { noremap = true})
remap('n', 'sv', '<cmd>vsplit <CR><C-w>w<plug>(wintabs_close)<C-w>w', { noremap = true})
