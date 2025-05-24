return {
    {
        "NvChad/nvterm",
        config = function()
            require("nvterm").setup({
                terminals = {
                    shell = vim.o.shell,
                    list = {},
                    type_opts = {
                        float = {
                            relative = "editor",
                            row = 0.3,
                            col = 0.25,
                            width = 0.5,
                            height = 0.4,
                            border = "single",
                        },
                    },
                },
                behavior = {
                    autoclose_on_quit = {
                        enabled = true,
                        confirm = false,
                    },
                    close_on_exit = true,
                    auto_insert = true,
                },
            })
        end,
        vim.keymap.set({ "n", "t" }, "<A-i>", function()
            require("nvterm.terminal").toggle("float")
        end, { desc = "Toggle Floating Terminal" }),
    },
}
