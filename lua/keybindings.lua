local keymap = vim.api.nvim_set_keymap

keymap('n', 'ff', '<cmd>Telescope find_files<cr>', {})
keymap('n', 'fg', '<cmd>Telescope live_grep<cr>', {})
keymap('n', 'fb', '<cmd>Telescope buffers<cr>', {})
keymap('n', '<c-space>', '<cmd>HopWord<cr>', {})
keymap('n', '<home>', '<cmd>NvimTreeToggle<cr>', {})
keymap('n', '<space>', '<cmd>noh<cr>', {})
keymap('n', 'c-l', '<cmd>Autoformat<cr>', {})
