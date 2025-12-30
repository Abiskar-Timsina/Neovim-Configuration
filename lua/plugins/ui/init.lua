-- ============================================================================
-- UI Enhancement Plugins
-- ============================================================================
-- This module imports plugins that enhance the visual appearance and user
-- interface of Neovim, including statusline, colorscheme, bufferline, and
-- startup screen.

return {
    { import = "plugins.ui.start-screen" },        -- Custom startup screen
    { import = "plugins.ui.status-bar" },         -- Statusline (lualine)
    { import = "plugins.ui.buffer" },             -- Bufferline (tab bar)
    { import = "plugins.ui.themes.catppuccin" },  -- Colorscheme
    -- { import = "plugins.ui.themes.tokyonight" },  -- Colorscheme
}
