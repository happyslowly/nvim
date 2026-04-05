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

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
			vim.cmd("TSUpdate")
		end
	end,
})
