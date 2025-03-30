local o = vim.o

o.autochdir = true
o.autoread = true
o.backspace = "indent,eol,start"
o.backup = false
o.colorcolumn = "80"
o.complete = ".,t,d,i"
o.completeopt = "menu,menuone"
o.cursorline = true
o.encoding = "utf-8"
o.expandtab = true
o.fileformats = "unix"
o.foldenable = false
o.foldmethod = "syntax"
o.hidden = true
o.hlsearch = true
o.ignorecase = true
o.incsearch = true
o.infercase = true
o.laststatus = 2
o.mouse = "a"
o.number = true
o.shiftwidth = 2
o.showcmd = true
o.showmatch = true
o.smartindent = true
o.softtabstop = 2
o.spelllang = "en"
o.spellsuggest = "5"
o.tabstop = 2
o.wildmenu = true
o.winborder = "rounded"
o.wrap = false

-- File type settings
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
