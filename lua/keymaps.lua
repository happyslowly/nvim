vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>e", ":NvimTreeToggle<Cr>", opts)
map({ "n", "x" }, "<Leader>y", '"+y', opts)
map("n", "<Leader>p", '"+p', opts)
map("n", "<Leader>a", "ggVG", opts)

map("n", "cc", "gcc", { remap = true })
map("n", "cb", "gbc", { remap = true })
map("x", "<Leader>c", "gc", { remap = true })
map("x", "<Leader>b", "gb", { remap = true })
