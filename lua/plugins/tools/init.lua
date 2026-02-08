-- ============================================================================
-- Development Tools Plugins
-- ============================================================================
-- This module imports essential development tools including LSP (Language
-- Server Protocol) support, autocompletion, formatting, and linting.
-- These plugins form the core of the modern Neovim development experience.

return {
    { import = "plugins.tools.none-ls" },        -- Formatting and linting
    { import = "plugins.tools.auto-complete" },   -- Autocompletion engine
    { import = "plugins.tools.mason" },          -- LSP/DAP installer and manager
    { import = "plugins.tools.nvim-lspconfig" }, -- LSP configuration
}
