vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
}, { confirm = false })

local builtin = require("telescope.builtin")
local map = vim.keymap.set

map("n", "<Leader>tf", builtin.find_files)
map("n", "<Leader>tg", builtin.live_grep)
map("n", "<Leader>tb", builtin.buffers)
map("n", "<Leader>th", builtin.help_tags)
map("n", "<Leader>ts", builtin.lsp_document_symbols)
map("n", "<Leader>tr", builtin.lsp_references)
