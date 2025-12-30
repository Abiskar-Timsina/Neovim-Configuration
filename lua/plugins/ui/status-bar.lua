-- ============================================================================
-- Lualine Status Bar Configuration
-- ============================================================================
-- Lualine provides a fast and customizable statusline for Neovim. It displays
-- useful information like current mode, file name, git status, LSP diagnostics,
-- and more. The statusline appears at the bottom of each window.

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- For filetype icons
    event = "VeryLazy", -- Load after UI is ready
    -- Use opts for cleaner configuration (Lazy automatically calls setup)
    opts = {
        options = {
            theme = "onedark" -- Colorscheme for statusline
        },
        -- Use global statusline (single statusline for all windows)
        globalstatus = true,
        -- Active window sections (left to right)
        sections = {
            lualine_a = { 'mode' },                          -- Current mode (NORMAL, INSERT, etc.)
            lualine_b = { 'branch', 'diff', 'diagnostics' }, -- Git branch, diff, LSP diagnostics
            lualine_c = {},                                  -- Empty (can add file path here)
            lualine_x = { 'filetype' },                      -- File type
            lualine_y = { 'location' },                      -- Cursor position (line:column)
            lualine_z = { 'filename' },                      -- File name
        },
        -- Inactive window sections (windows that aren't focused)
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' }, -- Show filename in inactive windows
            lualine_x = { 'location' }, -- Show location in inactive windows
            lualine_y = {},
            lualine_z = {}
        },
    },
}
