require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "fish",
    "html",
    "javascript",
    "json",
    "jsonc",
    "go",
    "lua",
    "markdown",
    "markdown_inline",
    "php",
    "python",
    "rust",
    "sql",
    "toml",
    "typescript",
    "yaml",
  },
  highlight = { enable = true },
  indent = { enable = true },
})
