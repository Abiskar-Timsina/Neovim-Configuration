-- ============================================================================
-- Flash Navigation Configuration
-- ============================================================================
-- Flash provides smart jump navigation by highlighting potential jump targets
-- and allowing you to quickly navigate to them. It's similar to vim-sneak or
-- EasyMotion but more modern and integrated with Neovim's LSP features.

return {
    "folke/flash.nvim",
    event = "VeryLazy", -- Load after UI is ready
    opts = {}, -- Use default options
    keys = {
        {
            "q", -- Press 'q' to activate flash jump
            mode = { "n" }, -- Normal mode only
            function()
                require("flash").jump()
            end,
            desc = "Flash Jump", -- Description for which-key
        },
    },
}
