-- ============================================================================
-- Programming Support Plugins
-- ============================================================================
-- This module imports plugins that enhance the programming experience with
-- features like syntax highlighting, code analysis, and TODO management.

return {
    { import = "plugins.programming.todo-highlight" }, -- TODO comment highlighting
    { import = "plugins.programming.treesitter" },     -- Advanced syntax highlighting
}
