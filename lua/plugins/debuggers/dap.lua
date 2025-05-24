return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")
        -- For PHP
        dap.adapters.php = {
            type = 'executable',
            command = 'node',
            args = { '/home/abiskar/.local/share/vscode-php-debug/out/phpDebug.js' }
        }
        -- For Golang
        --  go install github.com/go-delve/delve/cmd/dlv@latest
        --  Add the ~/go/bin path to the PATH if not found
        dap.adapters.delve = function(callback, config)
            if config.mode == 'remote' and config.request == 'attach' then
                callback({
                    type = 'server',
                    host = config.host or '127.0.0.1',
                    port = config.port or '38697'
                })
            else
                callback({
                    type = 'server',
                    port = '${port}',
                    executable = {
                        command = 'dlv',
                        args = { 'dap', '-l', '127.0.0.1:${port}', '--log', '--log-output=dap' },
                        detached = vim.fn.has("win32") == 0,
                    }
                })
            end
        end
        -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
        dap.configurations.go = {
            {
                type = "delve",
                name = "Debug",
                request = "launch",
                program = "${file}"
            },
            {
                type = "delve",
                name = "Debug test", -- configuration for debugging test files
                request = "launch",
                mode = "test",
                program = "${file}"
            },
            -- works with go.mod packages and sub packages
            {
                type = "delve",
                name = "Debug test (go.mod)",
                request = "launch",
                mode = "test",
                program = "./${relativeFileDirname}"
            }
        }

        dap.configurations.php = {
            {
                type = 'php',
                request = 'launch',
                name = 'Vortex Plugin Services',
                port = 13546,
                pathMappings = {
                    ["/home/grepsr/vortex-plugins/vortex-plugins-services"] =
                    "/home/abiskar/grepsr/vortex-plugins-services/",
                },
            },
            {
                type = 'php',
                request = 'launch',
                name = 'Vortex Plugin Services 2',
                port = 13546,
                pathMappings = {
                    ["/home/grepsr/vortex-plugins/vortex-plugins-services"] =
                    "/home/abiskar/grepsr/vortex-plugins-services-2/",
                },
            },
            {
                type = 'php',
                request = 'launch',
                name = 'Crawler Feasibility',
                port = 13546,
                pathMappings = {
                    ["/home/grepsr/vortex-plugins/vortex-plugins-services"] =
                    "/home/abiskar/grepsr/crawler-feasibility/",
                },
            },
        }
    end,
    keys = {
        { "<leader>db", "<cmd> DapToggleBreakpoint<CR>",                                               desc = "Add Debugger Breakpoint",            silent = true },
        { "<leader>do", "<cmd>lua require('dapui').open()<CR>",                                        desc = "Start the Debugger",                 silent = true },
        { "<leader>ds", "<cmd> DapContinue<CR>",                                                       desc = "Continue Debugger",                  silent = true },
        { "<leader>dq", "<cmd>lua require('dapui').close()<CR> <cmd> DapVirtualTextForceRefresh <CR>", desc = "Close Debugger",                     silent = true },
        { "<leader>de", "<cmd>lua require('dapui').eval(nil, { enter = true })<CR>",                   desc = "Display the chunck of virtual text", silent = true },
    },
}
