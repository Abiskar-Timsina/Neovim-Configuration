-- ============================================================================
-- Telescope Fuzzy Finder Configuration
-- ============================================================================
-- Telescope is a highly extendable fuzzy finder for Neovim. It provides
-- a unified interface for finding files, searching text, browsing symbols,
-- and more. It's one of the most powerful and essential plugins.

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8", -- Pin to stable version for reliability
    dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
    event = "VeryLazy", -- Lazy load for better startup performance
    keys = {
        { "<leader>ff", ":Telescope find_files<CR>",           desc = "Find Files",        silent = true },
        { "<leader>fw", ":Telescope live_grep<CR>",            desc = "Live Grep",         silent = true },
        { "<leader>fo", ":Telescope oldfiles<CR>",             desc = "Recent Files",      silent = true },
        { "<C-p>",      ":Telescope lsp_document_symbols<CR>", desc = "Symbol Definition", silent = true },
    },
    -- Use opts for cleaner configuration (Lazy automatically calls setup)
    opts = {
        defaults = {
            -- Use ripgrep (rg) for fast text searching
            vimgrep_arguments = {
                "rg",
                "-L",                    -- Follow symbolic links
                "--color=never",         -- Disable colors for cleaner output
                "--no-heading",          -- Don't show file headers
                "--with-filename",       -- Include filename in results
                "--line-number",         -- Show line numbers
                "--column",              -- Show column numbers
                "--smart-case",          -- Case-insensitive unless uppercase used
            },
            sorting_strategy = "ascending", -- Sort results ascending
            layout_strategy = "horizontal", -- Horizontal layout
            layout_config = {
                horizontal = {
                    prompt_position = "top",  -- Prompt at top
                    preview_width = 0.65,     -- Preview takes 65% width
                },
            },
            -- Custom border characters for better aesthetics
            border = {},
            borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        },
    },
}
