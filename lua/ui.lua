local o = vim.o

o.background = 'dark'
o.termguicolors = true

vim.cmd[[colorscheme tokyonight]]

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'tokyonight',
  }
}
