return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
        {
            "q",
            mode = { "n" },
            function()
                require("flash").jump()
            end,
            desc = "Flash",
        },
    },
}
