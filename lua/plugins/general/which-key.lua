-- ============================================================================
-- Which-Key Plugin Configuration
-- ============================================================================
-- Which-key provides a popup menu showing available keybindings when you
-- press a prefix key (like <leader>). This helps discover and remember
-- custom keybindings without memorizing them all.

return {
    "folke/which-key.nvim",
    event = "VeryLazy", -- Load after UI is ready for better performance
    opts = {
        -- Custom keybinding descriptions for the popup menu
        spec = {
            { "<leader>",  desc = "Decrement Selection", mode = "n" },
            { "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
        },
    },
}
