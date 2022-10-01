local augroup = vim.api.nvim_create_augroup("NullLsFormatting", {})
local null_ls = require("null-ls")

require("null-ls").setup({
    sources = {
        null_ls.builtins.formatting.stylua.with({
            extra_args = { "--config-path=" .. vim.fn["stdpath"]("config") .. "/stylua.toml" },
        }),
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.jq,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.clang_format,
    },
    -- on_attach = function(client, bufnr)
    --     if client.supports_method("textDocument/formatting") then
    --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --         vim.api.nvim_create_autocmd("BufWritePre", {
    --             group = augroup,
    --             buffer = bufnr,
    --             callback = function()
    --                 vim.lsp.buf.format({ bufnr = bufnr })
    --             end,
    --         })
    --     end
    -- end,
})
