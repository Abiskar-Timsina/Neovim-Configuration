-- ============================================================================
-- Treesitter Configuration
-- ============================================================================
-- Treesitter provides advanced syntax highlighting, code folding, and code
-- analysis using incremental parsing. It's much more accurate than regex-based
-- highlighting and provides better understanding of code structure. It's
-- essential for modern Neovim development.

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- Update parsers on install
    lazy = false,         -- Load early (needed for syntax highlighting)
    event = { "BufReadPost", "BufNewFile" }, -- Load when opening files
    opts = {
        -- Automatically install parsers for these languages
        ensure_installed = { "lua", "go", "python", "php", "c" },
        auto_install = false,  -- Don't auto-install missing parsers
        sync_install = false,  -- Install parsers asynchronously
        highlight = { enable = true }, -- Enable syntax highlighting
        indent = { enable = true },    -- Enable smart indentation
    },
}
