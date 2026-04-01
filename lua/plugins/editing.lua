vim.pack.add({
	"https://github.com/numToStr/Comment.nvim",
	"https://github.com/windwp/nvim-autopairs",
}, { confirm = false })

require("Comment").setup()
require("nvim-autopairs").setup({})
