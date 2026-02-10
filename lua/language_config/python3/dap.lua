-- For Python
-- Requirements:
-- 1. nvim-dap plugin
-- 2. pip install debugpy (inside your .venv or system)
local M = {}

M.configure = function(dap)
    -- 1. Python path detection (for the project's code)
    local function get_python_path()
        local cwd = vim.fn.getcwd()
        local venvs = { '/.venv/bin/python', '/venv/bin/python', '/env/bin/python' }
        for _, venv in ipairs(venvs) do
            local path = cwd .. venv
            if vim.fn.executable(path) == 1 then
                return path
            end
        end
        return 'python3'
    end

    -- Using vim.env.HOME makes this cross-platform (Linux/macOS)
    local data_path = vim.fn.stdpath("data")
    local mason_path = data_path .. "/mason/packages/debugpy/venv/bin/python"

    -- Register the Adapter (Always register, even if path is wrong, to avoid "No Configuration" error)
    dap.adapters.python = function(cb, config)
        if config.request == 'attach' then
            local port = (config.connect or config).port
            local host = (config.connect or config).host or '127.0.0.1'
            cb({
                type = 'server',
                port = assert(port, '`connect.port` is required for a python `attach` configuration'),
                host = host,
                options = { source_filetype = 'python' },
            })
        else
            -- Check for debugpy right before launching
            if vim.fn.executable(mason_path) ~= 1 then
                vim.notify("debugpy not found in Mason. Run :MasonInstall debugpy", vim.log.levels.ERROR)
                return
            end
            cb({
                type = 'executable',
                command = mason_path,
                args = { '-m', 'debugpy.adapter' },
                options = { source_filetype = 'python' },
            })
        end
    end

    -- 4. Set Configurations (Ensure this is always set)
    dap.configurations.python = {
        {
            type = 'python',
            request = 'launch',
            name = "Launch file (Venv Detection)",
            program = "${file}",
            -- This makes sure it uses the local venv if it exists
            pythonPath = get_python_path,
            console = "integratedTerminal",
        },
        {
            type = 'python',
            request = 'attach',
            name = 'Attach to External Process (Port 5678)',
            connect = {
                port = 5678,
                host = '127.0.0.1',
            },
            justMyCode = false,
            args = { "-Xfrozen_modules=off", "${file}" },
        },
    }
end

return M
