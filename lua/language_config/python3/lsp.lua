M = {}

M.configure = function(lspconfig, capabilities)
    lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = "off",
                    diagnosticSeverityOverrides = {
                        reportMissingModuleSource = "none",
                        reportMissingImports = "error",
                        reportUndefinedVariable = "warning",
                    },
                },
            },
        },
    })
end

return M
