local o = vim.o

o.background = "dark"
o.termguicolors = true

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "github_dark_dimmed",
	},
})

vim.cmd.colorscheme("github_dark_dimmed")
