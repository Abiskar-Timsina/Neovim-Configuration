return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")
        require("language_config.go.dap").configure(dap)
        require("language_config.php.dap").configure(dap)
    end,
    keys = {
        { "<leader>db", "<cmd> DapToggleBreakpoint<CR>",                                               desc = "Add Debugger Breakpoint",            silent = true },
        { "<leader>do", "<cmd>lua require('dapui').open()<CR>",                                        desc = "Start the Debugger",                 silent = true },
        { "<leader>ds", "<cmd> DapContinue<CR>",                                                       desc = "Continue Debugger",                  silent = true },
        { "<leader>dq", "<cmd>lua require('dapui').close()<CR> <cmd> DapVirtualTextForceRefresh <CR>", desc = "Close Debugger",                     silent = true },
        { "<leader>de", "<cmd>lua require('dapui').eval(nil, { enter = true })<CR>",                   desc = "Display the chunck of virtual text", silent = true },
    },
}
