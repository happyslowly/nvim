vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/folke/lazydev.nvim",
}, { confirm = false })

require("lazydev").setup({})

vim.lsp.log.set_level("error")

vim.diagnostic.config({
	virtual_lines = true,
	severity_sort = true,
	float = { border = "rounded", header = "" },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✗",
			[vim.diagnostic.severity.WARN] = "⚠",
			[vim.diagnostic.severity.INFO] = "➤",
			[vim.diagnostic.severity.HINT] = "ℹ",
		},
	},
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, opts)
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, opts)
vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist, opts)

vim.lsp.config("*", {
	capabilities = vim.lsp.protocol.make_client_capabilities(),
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if client and client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end

		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "grD", vim.lsp.buf.declaration, bufopts)
		vim.keymap.set("n", "grd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "grk", vim.lsp.buf.signature_help, bufopts)
	end,
})

vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			cargo = { allFeatures = true, buildScripts = { enable = true } },
			checkOnSave = true,
			procMacro = { enable = true },
			inlayHints = {
				closingBraceHints = true,
				parameterHints = true,
				typeHints = { enable = true, hideClosureInitialization = false },
			},
		},
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
		},
	},
})

vim.lsp.enable({ "lua_ls", "bashls", "pyright", "yamlls", "vtsls" })
