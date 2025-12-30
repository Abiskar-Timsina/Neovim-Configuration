-- ============================================================================
-- Catppuccin Colorscheme Configuration
-- ============================================================================
-- Catppuccin is a beautiful, modern colorscheme with multiple flavor options.
-- It provides excellent syntax highlighting and integrates well with many
-- Neovim plugins. The priority is set high to ensure it loads early.

return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- High priority to load early
    lazy = false,     -- Load immediately (colorscheme should be available early)
    -- NOTE: Using config instead of opts because we need to call vim.cmd.colorscheme()
    -- after setup. opts only handles setup(), but we need post-setup actions.
    config = function()
        require("catppuccin").setup({
            flavour = "macchiato", -- Options: latte, frappe, macchiato, mocha
            background = { -- Background variants for light/dark mode
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false, -- Opaque background
            show_end_of_buffer = false,     -- Hide '~' characters after buffer end
            term_colors = false,            -- Don't set terminal colors
            dim_inactive = {
                enabled = false,   -- Don't dim inactive windows
                shade = "dark",
                percentage = 0.15,
            },
            -- Text style options
            no_italic = false,     -- Allow italic text
            no_bold = false,       -- Allow bold text
            no_underline = false,  -- Allow underlined text
            -- Syntax highlighting styles (see :h highlight-args)
            styles = {
                comments = { "italic" },    -- Italic comments
                conditionals = { "italic" }, -- Italic conditionals
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },
            color_overrides = {},      -- Custom color overrides
            custom_highlights = {},    -- Custom highlight groups
            default_integrations = true, -- Enable default plugin integrations
            integrations = {
                cmp = true,        -- nvim-cmp integration
                gitsigns = true,   -- Git signs integration
                nvimtree = true,   -- Nvim-tree integration
                treesitter = true, -- Treesitter integration
                notify = false,    -- Disable notify integration
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
            },
        })

        -- Apply the colorscheme (must be called after setup)
        vim.cmd.colorscheme("catppuccin")
    end,
}
