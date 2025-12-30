-- ============================================================================
-- Telescope UI-Select Extension Configuration
-- ============================================================================
-- This extension integrates Telescope with vim.ui.select, allowing LSP
-- actions (like code actions, rename, etc.) to use Telescope's interface
-- instead of the default vim.ui.select menu.

return {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    -- NOTE: Using config instead of opts because we need to call load_extension()
    -- after setup(). opts only handles simple setup() calls.
    config = function()
        -- Configure the ui-select extension
        require("telescope").setup({
            extensions = {
                ["ui-select"] = {
                    -- Use dropdown theme for a cleaner look
                    require("telescope.themes").get_dropdown({
                        -- Additional theme options can be added here
                    }),
                },
            },
        })
        -- Load the extension so it's available for use
        require("telescope").load_extension("ui-select")
    end,
}
