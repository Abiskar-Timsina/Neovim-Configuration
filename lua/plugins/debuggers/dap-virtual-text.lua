-- ============================================================================
-- DAP Virtual Text Configuration
-- ============================================================================
-- nvim-dap-virtual-text displays debugging information inline as virtual text
-- next to your code. It shows variable values, function parameters, and other
-- debug information without needing to open the DAP UI panels.
--
-- NOTE: Requires the correct Treesitter parser to be installed for the
-- language you're debugging, otherwise virtual text won't appear.

return {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
    event = "VeryLazy", -- Load when needed
    -- Use opts for cleaner configuration (Lazy automatically calls setup)
    opts = {
        enabled = true,              -- Enable virtual text
        enabled_commands = true,     -- Enable DAP virtual text commands
        commented = false,           -- Don't show as comments (show as regular text)
        only_first_definition = false, -- Show all definitions, not just first
        all_references = true,       -- Show references to variables
    },
}
