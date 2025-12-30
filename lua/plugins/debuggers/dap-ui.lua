-- ============================================================================
-- DAP UI Configuration
-- ============================================================================
-- nvim-dap-ui provides a user interface for DAP debugging. It displays
-- debugging information in panels showing variables, watches, breakpoints,
-- and the call stack. The UI automatically opens when debugging starts
-- and closes when debugging ends.

return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",      -- Core DAP
        "nvim-neotest/nvim-nio"       -- Async utilities
    },
    event = "VeryLazy", -- Load when needed
    -- NOTE: Using config instead of opts because we need to set up DAP listeners
    -- after setup(). opts only handles simple setup() calls.
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup()
        
        -- Automatically open DAP UI when debugging starts
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        
        -- Automatically close DAP UI when debugging ends
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end
}
