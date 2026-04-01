vim.pack.add({
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/MunifTanjim/nui.nvim',
	'https://github.com/rcarriga/nvim-notify',
	'https://github.com/nvim-telescope/telescope.nvim',
	'https://github.com/kawre/leetcode.nvim',
}, { confirm = false })

require("leetcode").setup({
	storage = {
		home = vim.fn.getcwd(),
		cache = vim.fn.stdpath("cache") .. "/leetcode",
	},
	lang = "python3",
	plugins = { non_standalone = false },
	description = { position = "top" },
	debug = true,
})
