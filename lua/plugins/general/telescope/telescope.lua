return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>ff", ":Telescope find_files<CR>",           desc = "Find Files",        silent = true },
        { "<leader>fw", ":Telescope live_grep<CR>",            desc = "Live Grep",         silent = true },
        { "<leader>fo", ":Telescope oldfiles<CR>",             desc = "Recent Files",      silent = true },
        { "<C-p>",      ":Telescope lsp_document_symbols<CR>", desc = "Symbol Definition", silent = true },
    },
    config = function()
        require("telescope").setup({
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "-L",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                },
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.65,
                    },
                },
                border = {},
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            },
        })
    end,
}
