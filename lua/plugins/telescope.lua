vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}, { confirm = false })

local telescope = require("telescope")
local builtin = require("telescope.builtin")
local map = vim.keymap.set

telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})
telescope.load_extension("fzf")

local markers = { ".git", "package.json", "Cargo.toml", "pyproject.toml", "go.mod" }
local function root_dir()
	return vim.fs.root(0, markers) or vim.uv.cwd()
end

map("n", "<Leader>tf", function() builtin.find_files({ cwd = root_dir() }) end)
map("n", "<Leader>tg", function() builtin.live_grep({ cwd = root_dir() }) end)
map("n", "<Leader>tb", builtin.buffers)
map("n", "<Leader>th", builtin.help_tags)
map("n", "<Leader>ts", builtin.lsp_document_symbols)
map("n", "<Leader>tr", builtin.lsp_references)
