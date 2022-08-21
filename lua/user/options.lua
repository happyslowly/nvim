local o = vim.o

-- general
o.autochdir = true
o.autoread = true
o.backspace = "indent,eol,start"
o.backup = false
o.colorcolumn = 80
o.complete = ".,t,d,i"
o.completeopt = "menu,menuone"
o.cursorline = true
o.encoding = "utf-8"
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
o.showcmd = true
o.showmatch = true
o.spelllang = "en"
o.spellsuggest = 5
o.wildmenu = true
o.wrap = false

-- indent
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.softtabstop = 2
o.tabstop = 2
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    command = "setlocal shiftwidth=4 softtabstop=4 tabstop=4",
})
