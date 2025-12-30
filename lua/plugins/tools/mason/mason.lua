-- ============================================================================
-- Mason Plugin Manager Configuration
-- ============================================================================
-- Mason is a portable package manager for Neovim that installs and manages
-- LSP servers, DAP adapters, linters, formatters, and other development tools.
-- It eliminates the need to manually install these tools system-wide.
--
-- Mason installs tools to a Neovim-specific directory, making your setup
-- portable and isolated from system packages.

return {
    "williamboman/mason.nvim",
    event = "VeryLazy", -- Load after UI is ready
    -- Use opts for cleaner configuration (Lazy automatically calls setup)
    opts = {
        ui = {
            -- Check for outdated packages when opening Mason UI
            check_outdated_packages_on_open = true,
            -- Backdrop opacity for the UI (0-100)
            backdrop = 80,
        }
    },
}
