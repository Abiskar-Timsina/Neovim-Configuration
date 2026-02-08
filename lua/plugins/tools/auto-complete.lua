-- ============================================================================
-- Autocompletion Configuration (nvim-cmp)
-- ============================================================================
-- nvim-cmp is the completion engine for Neovim. It provides intelligent
-- autocompletion from various sources including LSP, snippets, buffers, etc.
-- LuaSnip provides snippet support, allowing expansion of code templates.

return {
    -- Snippet engine for code templates (load first)
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp", -- Build JS regexp support
        event = "InsertEnter",
    },
    -- Core completion engine
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter", -- Load when entering insert mode
        dependencies = {
            "L3MON4D3/LuaSnip",      -- Snippet engine
            "hrsh7th/cmp-nvim-lsp",  -- LSP completion source
        },
        -- NOTE: Using config instead of opts because we need custom mapping logic
        -- that accesses luasnip and cmp modules. opts is for simple setup() calls.
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            
            -- Configure completion with mappings and sources
            cmp.setup({
                mapping = {
                    -- Enter key: confirm or expand snippet
                    ['<CR>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            if luasnip.expandable() then
                                luasnip.expand() -- Expand snippet if available
                            else
                                cmp.confirm({
                                    select = true, -- Select item on confirm
                                })
                            end
                        else
                            fallback() -- Use default Enter behavior
                        end
                    end),
                    -- Tab: navigate to next completion item
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }), -- Insert and select modes

                    -- Shift+Tab: navigate to previous completion item
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
                sources = {
                    { name = "nvim_lsp" }, -- Enable LSP as completion source
                },
            })
        end,
    },
    -- LSP completion source (connects nvim-cmp to LSP)
    {
        "hrsh7th/cmp-nvim-lsp",
        event = { "InsertEnter", "CmdlineEnter" },
    },
}
