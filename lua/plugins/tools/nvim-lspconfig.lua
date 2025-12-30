-- ============================================================================
-- LSP Configuration (nvim-lspconfig)
-- ============================================================================
-- nvim-lspconfig configures Neovim's built-in LSP client to work with
-- language servers. This provides features like:
-- - Code completion (via nvim-cmp)
-- - Go to definition
-- - Hover documentation
-- - Diagnostics (errors, warnings)
-- - Code actions and refactoring
--
-- NOTE: For keybindings, use autocmd groups instead of direct mappings
-- to ensure they work properly with buffers. See :h vim.lsp.buf

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" }, -- Load when opening files
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- Required for LSP completion capabilities
    },
    -- NOTE: Using config instead of opts because we need to:
    -- 1. Call language-specific configuration modules
    -- 2. Call vim.lsp.enable() after setup
    -- opts only handles simple setup() calls.
    config = function()
        -- Get enhanced capabilities from nvim-cmp for better completion
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Configure language-specific LSP servers
        require("language_config.go.lsp").configure(capabilities)
        require("language_config.lua.lsp").configure(capabilities)
        require("language_config.php.lsp").configure(capabilities)
        require("language_config.python3.lsp").configure(capabilities)
        require("language_config.ts.lsp").configure(capabilities)

        -- Enable LSP servers (these should be installed via Mason)
        vim.lsp.enable({
            "gopls",        -- Go language server
            "clangd",       -- C/C++ language server
            "lua_ls",       -- Lua language server
            "ruff",         -- Python linter/formatter
            "tsserver",     -- TypeScript/JavaScript language server
            "intelephense", -- PHP language server
            "pyright"       -- Python LSP
        })
    end,
}
