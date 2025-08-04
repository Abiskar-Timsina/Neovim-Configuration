M = {}

M.configure = function(lspconfig, capabilities)
    lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
            pyright = {
                -- Using Ruff's import organizer
                disableOrganizeImports = true,
            },
            python = {
                analysis = {
                    typeCheckingMode = "strict",      -- NOTE: This may need to be `off` if it causes too much trouble.
                    diagnosticMode = "openFilesOnly", -- optional: reduce overhead
                    diagnosticSeverityOverrides = {
                        reportMissingModuleSource = "none",
                        reportMissingImports = "error",
                        reportUndefinedVariable = "warning",
                    },
                    -- Ignore all files for analysis to exclusively use Ruff for linting
                    ignore = { '*' },
                },
            },
        },
    })

    lspconfig.ruff.setup {
        capabilities = capabilities,
        init_options = {
            settings = {
                -- Any extra CLI arguments for `ruff` go here.
                args = {},
            }
        }
    }
end

return M
