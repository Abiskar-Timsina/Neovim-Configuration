return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "zbirenbaum/copilot.lua", -- correct dependency for the copilot adapter
    },
    version = "^18.0.0",
    keys = {
        { "<leader>ac", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
    },
    config = function()
        require("codecompanion").setup({
            adapters = {
                copilot = function()
                    return require("codecompanion.adapters").extend("copilot", {
                        schema = {
                            model = {
                                default = "claude-3.5-sonnet",
                            },
                        },
                    })
                end,
            },
            strategies = {
                chat = {
                    adapter = "copilot",
                    roles = { llm = "Copilot", user = "Abiskar" },
                    agent = {
                        tools = { "filesearch", "editor", "buffer" },
                    },
                },
                inline = { adapter = "copilot" },
                cmd = { adapter = "copilot" },
            },
            opts = {
                send_code = true,
                use_default_actions = true,
                use_default_prompts = true,
            },
        })
    end,
}
