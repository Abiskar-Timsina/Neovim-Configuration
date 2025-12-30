-- ============================================================================
-- Debugger Plugins (DAP)
-- ============================================================================
-- This module imports plugins for the Debug Adapter Protocol (DAP), which
-- provides debugging capabilities similar to VS Code. DAP allows you to set
-- breakpoints, step through code, inspect variables, and more.

return {
    { import = "plugins.debuggers.dap" },            -- Core DAP functionality
    { import = "plugins.debuggers.dap-ui" },         -- DAP UI panels
    { import = "plugins.debuggers.dap-virtual-text" }, -- Inline debug info
}
