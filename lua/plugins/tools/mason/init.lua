-- ============================================================================
-- Mason Module Imports
-- ============================================================================
-- This file imports all Mason-related plugins for managing development tools.

return {
    { import = "plugins.tools.mason.mason" },          -- Core Mason installer
    { import = "plugins.tools.mason.mason-lspconfig" } -- Mason-LSP bridge
}
