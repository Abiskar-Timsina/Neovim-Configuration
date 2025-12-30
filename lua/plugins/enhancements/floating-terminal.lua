-- ============================================================================
-- Floating Terminal Configuration (nvterm)
-- ============================================================================
-- nvterm provides a floating terminal integrated into Neovim. It allows you
-- to run shell commands without leaving the editor. The terminal can be
-- toggled on/off and supports multiple terminal types (horizontal, vertical, float).

return {
    {
        "NvChad/nvterm",
        event = "VeryLazy", -- Load after UI is ready
        -- Use opts for cleaner configuration (Lazy automatically calls setup)
        opts = {
            terminals = {
                shell = vim.o.shell, -- Use system default shell
                list = {},
                type_opts = {
                    -- Floating terminal configuration
                    float = {
                        relative = "editor", -- Relative to editor window
                        row = 0.3,           -- Vertical position (30% from top)
                        col = 0.25,          -- Horizontal position (25% from left)
                        width = 0.5,         -- 50% of editor width
                        height = 0.4,        -- 40% of editor height
                        border = "single",   -- Border style
                    },
                },
            },
            behavior = {
                -- Auto-close terminal when quitting Neovim
                autoclose_on_quit = {
                    enabled = true,
                    confirm = false, -- Don't ask for confirmation
                },
                close_on_exit = true, -- Close terminal when process exits
                auto_insert = true,    -- Enter insert mode when opening terminal
            },
        },
        -- Keybinding to toggle floating terminal
        keys = {
            {
                "<A-i>", -- Alt+i to toggle
                function()
                    require("nvterm.terminal").toggle("float")
                end,
                desc = "Toggle Floating Terminal",
                mode = { "n", "t" }, -- Works in normal and terminal modes
            },
        },
    },
}
