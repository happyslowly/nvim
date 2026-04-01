vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>t", ":NvimTreeToggle<Cr>", opts)
map({ "n", "x" }, "<Leader>y", '"+y', opts)
map("n", "<Leader>p", '"+p', opts)
map("n", "<Leader>a", "ggVG", opts)

map("n", "cc", "v:count == 0 ? '<Plug>(comment_toggle_linewise_current)' : '<Plug>(comment_toggle_linewise_count)'",
	{ expr = true, remap = true, replace_keycodes = false })
map("n", "cb", "v:count == 0 ? '<Plug>(comment_toggle_blockwise_current)' : '<Plug>(comment_toggle_blockwise_count)'",
	{ expr = true, remap = true, replace_keycodes = false })
map("x", "<Leader>c", "<Plug>(comment_toggle_linewise_visual)")
map("x", "<Leader>b", "<Plug>(comment_toggle_blockwise_visual)")

map("n", "<Leader>lr", ":Leet run<CR>")
map("n", "<Leader>ls", ":Leet submit<CR>")
