M = {}

M.configure = function(dap)
    dap.adapters.php = {
        type = 'executable',
        command = 'node',
        args = { os.getenv("HOME") .. '/.local/share/vscode-php-debug/out/phpDebug.js' }
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
end

return M
