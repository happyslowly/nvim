local o = vim.o

o.background = "dark"
o.termguicolors = true

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "kanagawa",
  },
})

vim.cmd.colorscheme "kanagawa-dragon"
