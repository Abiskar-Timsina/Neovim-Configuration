-- ============================================================================
-- DAP (Debug Adapter Protocol) Core Configuration
-- ============================================================================
-- nvim-dap provides debugging functionality for Neovim using the Debug Adapter
-- Protocol. It supports debugging various languages by connecting to language-
-- specific debug adapters. This is the core plugin that provides breakpoints,
-- stepping, variable inspection, and more.

return {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",                    -- Load when needed
    dependencies = {
        "rcarriga/nvim-dap-ui",            -- UI for DAP
        "theHamsta/nvim-dap-virtual-text", -- Inline debug info
    },
    -- NOTE: Using config instead of opts because we need to call language-specific
    -- DAP configuration modules. opts only handles simple setup() calls.
    config = function()
        local dap = require("dap")

        -- Configure language-specific debug adapters
        require("language_config.go.dap").configure(dap)
        require("language_config.php.dap").configure(dap)
        require("language_config.python3.dap").configure(dap)

        -- Load VS Code's launch.json if it exists in the project
        require('dap.ext.vscode').load_launchjs(nil, {
            python = { 'python' },
            go = { 'go' },
            delve = { 'go' }
        })

    end,
    keys = {
        { "<leader>db", "<cmd>DapToggleBreakpoint<CR>",                                             desc = "Toggle Breakpoint",        silent = true },
        { "<leader>do", "<cmd>lua require('dapui').open()<CR>",                                     desc = "Open Debugger UI",         silent = true },
        { "<leader>ds", "<cmd>DapContinue<CR>",                                                     desc = "Start/Continue Debugging", silent = true },
        { "<leader>dq", "<cmd>lua require('dapui').close()<CR><cmd>DapVirtualTextForceRefresh<CR>", desc = "Close Debugger",           silent = true },
        { "<leader>de", "<cmd>lua require('dapui').eval(nil, { enter = true })<CR>",                desc = "Evaluate Expression",      silent = true },
    },
}
