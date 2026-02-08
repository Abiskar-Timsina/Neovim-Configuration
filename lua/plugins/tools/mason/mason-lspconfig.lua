-- ============================================================================
-- Mason-LSPconfig Bridge Configuration
-- ============================================================================
-- mason-lspconfig bridges Mason (the installer) with nvim-lspconfig (the
-- LSP client). It provides the `ensure_installed` feature to automatically
-- install LSP servers via Mason, and can optionally auto-configure them.
--
-- WARN: automatic_enable is set to false because we manually configure
-- each LSP server in language_config/*/lsp.lua files. Enabling this would
-- cause duplicate attachments and virtual text appearing multiple times.

return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} }, -- Core Mason (using new org name)
        { "neovim/nvim-lspconfig" }            -- LSP configuration
    },
    event = "VeryLazy", -- Load after dependencies
    -- Use opts for cleaner configuration (Lazy automatically calls setup)
    opts = {
        -- Automatically install these LSP servers via Mason
        ensure_installed = {
            "lua_ls",      -- Lua language server
            "intelephense", -- PHP language server
            "clangd",      -- C/C++ language server
            "gopls",       -- Go language server
        },
        -- Disable automatic configuration (we configure manually)
        automatic_enable = false,
    },
}
