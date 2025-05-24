-- Autocommands let you run specific Lua code or Vim commands automatically when certain events happen.
-- Example:
--vim.api.nvim_create_autocmd("BufWritePost", {
--  pattern = "*.py",
--  callback = function()
--    print("Python file saved!")
--  end,
-- })

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight the block when yanking",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ timeout = 250 })
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspMappings", {}),
    callback = function(ev) -- Not sure what this ev is, this is passed in the docs hence used here.
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, opts, { desc = "Format Code" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end,
})
