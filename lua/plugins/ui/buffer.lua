-- ============================================================================
-- Bufferline Configuration
-- ============================================================================
-- Bufferline provides a tab-like interface for managing multiple buffers.
-- It displays open buffers as tabs at the top of the editor, making it easy
-- to see and switch between open files. It integrates with LSP diagnostics
-- to show errors/warnings on buffer tabs.

return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- For filetype icons
    event = "VeryLazy", -- Load after UI is ready
    -- Use opts for cleaner configuration (Lazy automatically calls setup)
    opts = {
        options = {
            mode = "buffers",              -- Display buffers (not tab pages)
            close_command = "bdelete! %d", -- Command to close buffer
            right_mouse_command = "bdelete! %d", -- Right-click to close
            show_close_icon = true,        -- Show close button on tabs
            show_tab_indicators = true,    -- Show tab indicators
            diagnostics = "nvim_lsp",      -- Show LSP diagnostics on tabs
            color_icons = true,            -- Color filetype icons
            -- Custom icon function using nvim-web-devicons
            get_element_icon = function(element)
                local icon, hl =
                    require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
                return icon, hl
            end,
            separator_style = "slant",     -- Visual separator style
            always_show_bufferline = true, -- Always show even with one buffer
            sort_by = "insert_at_end"      -- Sort buffers by insertion order
        },
    },
}
