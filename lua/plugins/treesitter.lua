vim.pack.add({
	'https://github.com/nvim-treesitter/nvim-treesitter',
}, { confirm = false })

require("nvim-treesitter").setup({
	ensure_installed = {
		"bash", "c", "cpp", "css", "fish", "html", "javascript",
		"json", "jsonc", "go", "lua", "markdown", "markdown_inline",
		"php", "python", "rust", "sql", "toml", "typescript", "yaml",
	},
	highlight = { enable = true },
	indent = { enable = true },
})
