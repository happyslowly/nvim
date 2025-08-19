local o = vim.o

o.background = "dark"
o.termguicolors = true

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "github_dark_dimmed",
	},
})

require("github-theme").setup({
	options = {
		styles = {
			comments = "italic",
			keywords = "italic",
			types = "italic,bold",
		},
	},
})
vim.cmd.colorscheme("github_dark_dimmed")
