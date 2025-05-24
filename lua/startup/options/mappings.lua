-- Movement between windows,
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Basic key bindings.
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- line numbers
vim.keymap.set("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle Number" })
vim.keymap.set("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle Relative Number" })

-- Buffer change
vim.keymap.set({ "n" }, "<Tab>", "<cmd>bnext<CR>", { desc = "Switch to next buffer" })
vim.keymap.set({ "n" }, "<S-Tab>", "<cmd>bprev<CR>", { desc = "Switch to prev buffer" })
vim.keymap.set({ "n" }, "<leader>b", "<cmd>enew<CR>", { desc = "Create new buffer" })
vim.keymap.set("n", "<leader>x", function()
    local bufnr = vim.api.nvim_get_current_buf()
    -- Check if there are other buffers available
    local buffers = vim.fn.getbufinfo({ buflisted = 1 })
    if #buffers > 1 then
        -- Switch to the next buffer before deleting the current one
        vim.cmd("bnext")
    end
    vim.cmd("bdelete! " .. bufnr)
end, { desc = "Close current buffer" })
