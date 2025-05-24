return {
    "akinsho/bufferline.nvim",
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers",              -- Use tab pages for buffers
                close_command = "bdelete! %d", -- Command to close buffer
                right_mouse_command = "bdelete! %d",
                show_close_icon = true,        -- Hide close icon
                show_tab_indicators = true,
                diagnostics = "nvim_lsp",      -- Optional: show LSP diagnostics
                color_icons = true,            -- whether or not to add the filetype icon highlights
                get_element_icon = function(element)
                    local icon, hl =
                        require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
                    return icon, hl
                end,
                separator_style = "slant",
                always_show_bufferline = true,
                sort_by = "insert_at_end"
            },
        })
    end,
}
