-- ============================================================================
-- Neovim Configuration for v0.11+
-- Optimized for Lazy.nvim plugin manager
-- ============================================================================

-- Set global leader keys for custom keybindings
-- Space is the primary leader, making it easy to access custom commands
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- ============================================================================
-- Lazy.nvim Installation and Setup
-- ============================================================================
-- Lazy.nvim is a modern plugin manager for Neovim that provides:
-- - Lazy loading for better startup performance
-- - Dependency management
-- - Automatic updates and version pinning
-- - Clean plugin specification using Lua tables

local lazyPath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if Lazy is installed, clone if missing
-- Using vim.uv (Neovim 0.11+) with fallback to vim.loop for compatibility
if not vim.uv.fs_stat(lazyPath) then
    local lazyRepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyRepo, lazyPath })
    if vim.v.shell_error ~= 0 then
        error("Error cloning lazy.nvim:\n" .. out)
    end
end

-- Prepend Lazy to runtime path so it can be loaded
vim.opt.rtp:prepend(lazyPath)

-- ============================================================================
-- Initialize Lazy Plugin Manager
-- ============================================================================
-- The 'import' directive tells Lazy to load plugin specs from the specified
-- module. This allows for modular organization of plugins.
-- Plugins are loaded lazily by default unless specified otherwise.
require("lazy").setup({
    spec = {
        { import = "plugins.ui" },          -- UI enhancements (statusline, colorscheme, etc.)
        { import = "plugins.general" },      -- General purpose plugins (telescope, file tree, etc.)
        { import = "plugins.tools" },       -- Development tools (LSP, autocomplete, etc.)
        { import = "plugins.enhancements" }, -- Quality of life improvements
        { import = "plugins.debuggers" },   -- Debugging support (DAP)
        { import = "plugins.misc" },        -- Miscellaneous utilities
        { import = "plugins.programming" }, -- Programming aids (treesitter, todo comments)
    },
    -- Performance optimizations for Neovim 0.11+
    performance = {
        rtp = {
            -- Disable unused runtime paths for faster startup
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
    -- Disable automatic update checker (enable if desired)
    checker = { enabled = false },
})

-- ============================================================================
-- Load Neovim Options and Settings
-- ============================================================================
-- Load custom options, mappings, and other startup configurations
-- This is loaded after Lazy setup to ensure plugins are available
require("startup.options").load_options()
