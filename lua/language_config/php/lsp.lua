M = {}

M.configure = function(capabilities)
    vim.lsp.config.intelephense = {
        capabilities = capabilities,
        settings = {
            intelephense = {
                diagnostics = {
                    enable = true,
                    undefinedVariables = true,
                    undefinedSymbols = false,
                    undefinedTypes = false,
                    undefinedFunctions = true,
                    undefinedMethods = true,
                    undefinedProperties = false,
                    duplicateSymbols = true,
                    undefinedClassConstans = false,
                    undefinedConstants = false,
                    typeErrors = false,
                    implementationErros = false,
                },
                completion = {
                    maxItems = 5,
                },
            },
        },
    }
end

return M
