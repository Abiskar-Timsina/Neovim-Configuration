-- Setup global attributes.
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- Load up vim options to make life easier
-- For more options `:help option-list`
require("startup.options").load_options()


-- Check if the lazy plugin has been installed.
local lazyPath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazyPath) then
    local lazyRepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyRepo, lazyPath })
    if vim.v.shell_error ~= 0 then
        error("Error cloning lazy.nvim:\n" .. out)
    end
end
vim.opt.rtp:prepend(lazyPath)

-- The config and import and install will all be managed by lazy when required this way, refer to the notes.
require("lazy").setup({
    require("plugins.ui"),
    require("plugins.general"),
    require("plugins.tools"),
    require("plugins.enhancements"),
    require("plugins.programming"),
    require("plugins.debuggers"),
    require("plugins.misc"),
})
