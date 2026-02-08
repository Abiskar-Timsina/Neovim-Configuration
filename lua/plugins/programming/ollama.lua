return {
    "olimorris/codecompanion.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    version = "^18.0.0",
    keys = {
        { "ac", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
    },

    config = function()
        require("codecompanion").setup({
            adapters = {
                ollama = function()
                    return require("codecompanion.adapters").extend("ollama", {
                        schema = {
                            model = { default = "qwen3-coder:30b" }, -- default model
                        },
                    })
                end,
            },
            strategies = {
                chat = {
                    adapter = "ollama",
                    roles = {
                        llm = "Ollama",
                        user = "Abiskar"
                    },
                },
                inline = {
                    adapter = "ollama",
                },
                agent = { adapter = "ollama" },
            },
        })
    end,
}
