local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = '<SPACE>'

keymap('n', '<F3>', ':NvimTreeToggle<CR>', opts)
keymap('n', '<LEADER>Y', '"+y', opts)
keymap('n', '<LEADER>P', '"+p', opts)
