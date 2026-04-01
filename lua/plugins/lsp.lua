vim.pack.add({
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/folke/lazydev.nvim",
	"https://github.com/mfussenegger/nvim-lint",
	"https://github.com/stevearc/conform.nvim",
}, { confirm = false })

local conform = require("conform")
local lint = require("lint")

require("lazydev").setup({})

vim.lsp.log.set_level("error")

vim.diagnostic.config({
	virtual_lines = true,
	underline = true,
	update_in_insert = false,
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
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

		if client and client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end

		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
		vim.keymap.set("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
		vim.keymap.set("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
		vim.keymap.set("n", "<Leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, bufopts)
		vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, bufopts)
		vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, bufopts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
		vim.keymap.set("n", "<Leader>f", function()
			conform.format()
		end, bufopts)
	end,
})

vim.lsp.config("pyright", {})
vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			diagnostics = { enable = true },
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
			diagnostics = { globals = { "vim" } },
		},
	},
})
vim.lsp.config("clangd", {})

require("mason").setup({
	ui = {
		icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" },
	},
})

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "bashls", "pyright", "yamlls", "vtsls", "taplo" },
	automatic_enable = { exclude = { "taplo" } },
})

lint.linters_by_ft = {
	bash = { "shellcheck" },
	javascript = { "eslint" },
	typescript = { "eslint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
	callback = function()
		lint.try_lint()
	end,
})

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
