return {
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            cmp.setup({
                mapping = {
                    ['<CR>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            if luasnip.expandable() then
                                luasnip.expand()
                            else
                                cmp.confirm({
                                    select = true,
                                })
                            end
                        else
                            fallback()
                        end
                    end),
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
                },
            })
        end,
    },
    { "hrsh7th/nvim-cmp" },
    {
        "hrsh7th/cmp-nvim-lsp",
        event = { "InsertEnter", "CmdlineEnter" },
        config = function()
            require("cmp").setup({
                sources = {
                    { name = "nvim_lsp" },
                },
            })
        end,
    },
}
