-- ============================================================================
-- Nvim-Tree File Explorer Configuration
-- ============================================================================
-- Nvim-tree provides a file tree explorer sidebar, replacing netrw.
-- It offers better performance, more features, and better integration
-- with the Neovim ecosystem.

return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy", -- Lazy load to improve startup time
        opts = {
            -- Disable netrw (built-in file explorer) to avoid conflicts
            disable_netrw = true,
            hijack_cursor = true,      -- Move cursor to tree when opening
            hijack_netrw = true,       -- Take over netrw functionality
            hijack_unnamed_buffer_when_opening = true,

            -- Automatically update focused file in tree
            update_focused_file = {
                enable = true,
                update_root = false,   -- Don't change root directory
            },

            -- Display tree on the right side
            view = {
                side = "right",
            },

            -- Window picker for opening files in specific windows
            actions = {
                open_file = {
                    window_picker = {
                        enable = true,
                        chars = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ",
                    },
                },
            },

            -- Visual enhancements
            renderer = {
                indent_markers = {
                    enable = true,      -- Show indentation markers
                },
            },
        },

        -- Keybindings for tree operations
        keys = {
            { "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "NvimTree Toggle" },
            { "<leader>e", "<cmd>NvimTreeFocus<CR>", desc = "NvimTree Focus" },
        },
    },
}
