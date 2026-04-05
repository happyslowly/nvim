vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
}, { confirm = false })

local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		bash = { "shfmt" },
		lua = { "stylua" },
		python = { "isort", "black" },
		json = { "prettier" },
		yaml = { "prettier" },
		typescript = { "prettier" },
		javascript = { "prettier" },
		markdown = { "prettier" },
		toml = { "taplo" },
		cpp = { "clang-format" },
		c = { "clang-format" },
	},
	format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.keymap.set("n", "<Leader>f", function()
			conform.format()
		end, { buffer = args.buf })
	end,
})
