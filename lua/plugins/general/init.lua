-- ============================================================================
-- General Purpose Plugins
-- ============================================================================
-- This module imports general-purpose plugins that enhance core Neovim
-- functionality such as file navigation, keybinding discovery, and file tree.

return {
    { import = "plugins.general.which-key" },   -- Keybinding help and discovery
    { import = "plugins.general.telescope" },   -- Fuzzy finder and file navigation
    { import = "plugins.general.nvim-tree" },   -- File tree explorer
}
