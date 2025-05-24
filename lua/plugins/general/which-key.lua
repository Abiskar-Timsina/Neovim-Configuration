return {
    "folke/which-key.nvim",
    opts = {
        spec = {
            { "<leader>",  desc = "Decrement Selection", mode = "n" },
            { "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
        },
    },
}
