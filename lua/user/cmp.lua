local cmp = require("cmp")

local get_settings = function(show_documenation)
    return {
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        sources = cmp.config.sources({
            { name = "nvim_lsp", keyword_length = 2 },
            { name = "path" },
            { name = "buffer", keyword_length = 2 },
        }),
        window = {
            documentation = show_documenation and cmp.config.window.bordered() or cmp.config.disable,
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, { "i", "s" }),
        }),
    }
end

local default_settings = get_settings(true)
cmp.setup.filetype({ "scala" }, get_settings(false))
cmp.setup(default_settings)
