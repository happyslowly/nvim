local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

vim.g.mapleader = " "

keymap("n", "<F3>", ":NvimTreeToggle<Cr>", opts)
keymap({ "n", "x" }, "<Leader>y", '"+y', opts)
keymap("n", "<Leader>p", '"+p', opts)
keymap("n", "<Leader>a", "ggVG", opts)

keymap(
  "n",
  "cc",
  "v:count == 0 ? '<Plug>(comment_toggle_linewise_current)' : '<Plug>(comment_toggle_linewise_count)'",
  { expr = true, remap = true, replace_keycodes = false }
)
keymap(
  "n",
  "cb",
  "v:count == 0 ? '<Plug>(comment_toggle_blockwise_current)' : '<Plug>(comment_toggle_blockwise_count)'",
  { expr = true, remap = true, replace_keycodes = false }
)
keymap("x", "<Leader>c", "<Plug>(comment_toggle_linewise_visual)")
keymap("x", "<Leader>b", "<Plug>(comment_toggle_blockwise_visual)")
keymap("n", "<Leader>lr", ":Leet run<CR>")
keymap("n", "<Leader>ls", ":Leet submit<CR>")
