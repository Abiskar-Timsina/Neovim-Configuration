-- ============================================================================
-- Miscellaneous Utility Plugins (Mini.nvim Suite)
-- ============================================================================
-- This module contains various mini.nvim plugins that provide essential
-- editing utilities. Mini.nvim is a collection of minimal, focused plugins
-- that are lightweight and performant.

return {
    -- Comment/uncomment lines and blocks
    {
        'echasnovski/mini.comment',
        version = '*',
        event = "VeryLazy",
        -- Use opts for cleaner configuration (Lazy automatically calls setup)
        opts = {
            mappings = {
                comment_line = "<leader>/", -- Toggle line comment
                comment_visual = "/",       -- Toggle visual selection comment
            }
        },
    },
    -- Auto-pair brackets, quotes, etc.
    {
        'echasnovski/mini.pairs',
        version = '*',
        event = "InsertEnter", -- Load when entering insert mode
        -- Use opts with empty table for default configuration
        opts = {},
    },
    -- Visual indentation guides
    {
        'echasnovski/mini.indentscope',
        version = '*',
        event = "VeryLazy",
        -- Use opts with empty table for default configuration
        opts = {},
    },
    -- Icon utilities
    {
        'echasnovski/mini.icons',
        version = '*',
        event = "VeryLazy",
        -- Use opts with empty table for default configuration
        opts = {},
    },
    -- Surround text with brackets, quotes, tags, etc.
    {
        'echasnovski/mini.surround',
        version = '*',
        event = "VeryLazy",
        -- Use opts for cleaner configuration (Lazy automatically calls setup)
        opts = {
            -- Custom mappings using 'a' prefix (since 's' is used for in-place replacement)
            mappings = {
                add = 'aa',            -- Add surrounding in Normal and Visual modes
                delete = 'ad',         -- Delete surrounding
                find = 'af',           -- Find surrounding (to the right)
                find_left = 'aF',      -- Find surrounding (to the left)
                highlight = 'ah',      -- Highlight surrounding
                replace = 'ar',        -- Replace surrounding
                update_n_lines = 'an', -- Update `n_lines`
            }
        },
    }
}
