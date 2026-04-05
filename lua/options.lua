local o = vim.o

o.autoread = true
o.colorcolumn = "80"
o.completeopt = "menu,menuone,noselect"
o.cursorline = true
o.expandtab = true
o.fileformats = "unix"
o.foldenable = false
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.ignorecase = true
o.infercase = true
o.laststatus = 3
o.mouse = "a"
o.number = true
o.shiftwidth = 2
o.softtabstop = 2
o.spelllang = "en"
o.spellsuggest = "5"
o.tabstop = 2
o.winborder = "rounded"
o.pumborder = "rounded"
o.wrap = false
o.updatetime = 250
o.timeoutlen = 300
o.undofile = true
o.scrolloff = 8
o.sidescrolloff = 8

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python", "lua", "yaml" },
	callback = function()
		local ft = vim.bo.filetype
		if ft == "python" or ft == "lua" then
			vim.bo.shiftwidth = 4
			vim.bo.softtabstop = 4
			vim.bo.tabstop = 4
		elseif ft == "yaml" then
			vim.wo.cursorcolumn = true
		end
	end,
})
