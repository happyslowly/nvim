local o = vim.o

o.background = "dark"
o.termguicolors = true

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "nightfox",
	},
})

require("nightfox").setup({
	options = {
		styles = {
			comments = "italic",
			keywords = "bold",
			types = "italic,bold",
		},
	},
})

vim.cmd.colorscheme("nightfox")
