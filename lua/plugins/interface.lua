vim.pack.add({
	"https://github.com/EdenEast/nightfox.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/nvim-tree/nvim-tree.lua",
	"https://github.com/windwp/nvim-autopairs",
}, { confirm = false })

vim.o.background = "dark"
vim.o.termguicolors = true

require("nightfox").setup({
	options = {
		styles = { comments = "italic", keywords = "bold", types = "italic,bold" },
	},
})
vim.cmd.colorscheme("nightfox")

require("lualine").setup({
	options = { icons_enabled = true, theme = "nightfox" },
})

require("nvim-tree").setup({
	view = {
		float = {
			enable = true,
			open_win_config = { relative = "cursor", width = 48 },
		},
	},
})

require("nvim-autopairs").setup({})
