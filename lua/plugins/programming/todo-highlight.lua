-- ============================================================================
-- TODO Comments Highlighting Configuration
-- ============================================================================
-- todo-comments highlights TODO, FIXME, NOTE, and other comment keywords
-- in your code. It makes it easy to find and track todos, bugs, and notes
-- throughout your codebase. It also provides search functionality to find
-- all todos across files.

return {
    "folke/todo-comments.nvim",
    event = "VimEnter", -- Load on startup
    dependencies = { "nvim-lua/plenary.nvim" }, -- Required for search functionality
    opts = {
        signs = true, -- Show signs in the sign column
        keywords = {
            -- Fix/Bug keywords (red)
            FIX = {
                icon = " ",
                color = "error",
                alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
            },
            -- Todo keywords (blue)
            TODO = { icon = " ", color = "#13aaec" },
            -- Hack keywords (warning/yellow)
            HACK = { icon = " ", color = "warning" },
            -- Warning keywords (red)
            WARN = { icon = " ", color = "#ff0015", alt = { "WARNING", "XXX" } },
            -- Performance keywords
            PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            -- Note keywords (green)
            NOTE = { icon = " ", color = "#38c762", alt = { "INFO" } },
            -- Test keywords
            TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        }
    },
}
