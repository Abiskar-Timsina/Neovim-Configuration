-- NOTE: Allows nifty key actions, such as docs on hover and such
--`:h vim.lsp.buf`

-- WARN: don't use the mappings for vim buffer's (doesn't work propery) instead use autocmd groups
-- mappings = {
--         {'K', vim.lsp.buf.hover, desc="Display information about symbol under cursor"},
--         {'gd', vim.lsp.buf.definition, desc="Goto the definition"},
-- }
return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        lspconfig.gopls.setup({
            capabilities = capabilities
        })

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
        })

        lspconfig.ts_ls.setup({
            capabilities = capabilities,
        })

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

        lspconfig.intelephense.setup({
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
        })
    end,

}
