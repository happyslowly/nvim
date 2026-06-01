vim.pack.add({ "https://github.com/stevearc/aerial.nvim" }, { confirm = false })

require("aerial").setup({
	backends = { "lsp", "treesitter" },
	layout = {
		max_width = { 40, 0.2 },
		min_width = 30,
		default_direction = "right",
		placement = "edge",
	},
	show_guides = true,
	guides = {
		mid_item   = "├── ",
		last_item  = "└── ",
		nested_top = "│   ",
		whitespace = "    ",
	},
	filter_kind = {
		"Class", "Constructor", "Enum", "Function", "Interface", "Method", "Struct",
	},
	highlight_on_hover = true,
	autojump = true,
})

vim.keymap.set("n", "<Leader>a", "<Cmd>AerialToggle<CR>")
vim.keymap.set("n", "{", "<Cmd>AerialPrev<CR>")
vim.keymap.set("n", "}", "<Cmd>AerialNext<CR>")
