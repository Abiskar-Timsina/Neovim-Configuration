-- vim.schedule() defers execution until the main event loop is running — basically, after Neovim has fully started and all plugins have loaded.

-- Setup clipboard between system and nvim, we need to schedule it as we need nvim to be fully ready before we setup the clipboard.
-- as it's an 'external' dependency.
-- See: `:help clipboard`
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)
