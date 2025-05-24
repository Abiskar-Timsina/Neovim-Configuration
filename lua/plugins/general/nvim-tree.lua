return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("nvim-tree").setup({
                disable_netrw = true,
                hijack_cursor = true,
                hijack_netrw = true,
                hijack_unnamed_buffer_when_opening = true,
                update_focused_file = {
                    enable = true,
                    update_root = false,
                },
                view = {
                    side = "right",
                },
                actions = {
                    open_file = {
                        window_picker = {
                            enable = true,
                            chars = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                        }
                    }
                },
                renderer = {
                    indent_markers = {
                        enable = true,
                    }
                }
            })
        end,
        keys = {
            { "<C-n>",     ":NvimTreeToggle<CR>", desc = "Nvim tree Toggle", silent = true },
            { "<leader>e", ":NvimTreeFocus<CR>",  desc = "Nvim tree Focus",  silent = true },
        }
    }
}
