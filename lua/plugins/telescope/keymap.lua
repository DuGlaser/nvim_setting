local remap = vim.api.nvim_set_keymap

remap('n', '<Space>cf', '<cmd>lua require("telescope.builtin").find_files()<cr>', { noremap = true})
remap('n', '<Space>cg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', { noremap = true})
