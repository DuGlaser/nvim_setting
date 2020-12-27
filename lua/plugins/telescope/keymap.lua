local remap = vim.api.nvim_set_keymap

remap('n', '<Space>cf', '<cmd>lua require("telescope.builtin").find_files(require(\'telescope.themes\').get_dropdown({}))<cr>', { noremap = true})
remap('n', '<Space>cg', '<cmd>lua require("telescope.builtin").live_grep(require(\'telescope.themes\').get_dropdown({}))<cr>', { noremap = true})
