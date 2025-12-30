-- ============================================================================
-- None-LS Configuration (Formatting and Linting)
-- ============================================================================
-- None-LS (formerly null-ls) bridges the gap between standalone command-line
-- formatters/linters and Neovim's LSP ecosystem. It wraps these tools as
-- pseudo-LSP servers so they integrate seamlessly with LSP features like
-- auto-formatting on save and inline diagnostics.
--
-- NOTE: Even though this is none-ls, it's still accessed via 'null-ls'
-- because it's a fork of null-ls and maintains API compatibility.

return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim", -- Additional builtin sources
    },
    event = { "BufReadPre", "BufNewFile" }, -- Load when opening files
    -- NOTE: Using config instead of opts because we need to call language-specific
    -- configuration modules that return formatting/diagnostics sources.
    -- opts only handles simple setup() calls.
    config = function()
        -- Access the none-ls interface (still called null-ls for compatibility)
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting   -- Formatter sources
        local diagnostics = null_ls.builtins.diagnostics -- Linter/diagnostic sources

        -- Configure none-ls with language-specific formatters
        -- See https://github.com/nvimtools/none-ls.nvim for available builtins
        null_ls.setup({
            sources = {
                -- Language-specific formatting configurations
                require("language_config.go.none-ls").formatting(formatting),
                require("language_config.php.none-ls").formatting(formatting),
                -- Python formatting/linting (commented out - can be enabled if needed)
                -- require("language_config.python3.none-ls").formatting(formatting),
                -- require("language_config.python3.none-ls").diagnostics(diagnostics),
                require("language_config.ts.none-ls").formatting(formatting),
            },
        })
    end,
}
