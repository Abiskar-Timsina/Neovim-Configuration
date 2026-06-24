M = {}

M.configure = function(capabilities)
    vim.lsp.config.jdtls = {
        capabilities = capabilities,
        init_options = {
            extendedClientCapabilities = {
                progressReportProvider = true,
                classFileContentsSupport = true,
            },
            -- Tells the server it's safe to look for standard runtimes
            settings = {
                java = {
                    signatureHelp = { enabled = true },
                    contentProvider = { preferred = 'fernflower' },
                    completion = {
                        favoriteStaticMembers = {
                            "org.hamcrest.MatcherAssert.assertThat",
                            "org.hamcrest.Matchers.*",
                            "org.hamcrest.CoreMatchers.*",
                            "org.junit.jupiter.api.Assertions.*",
                            "java.util.Objects.requireNonNull",
                            "java.util.Objects.requireNonNullElse",
                            "org.mockito.Mockito.*"
                        },
                        filteredTypes = {
                            "com.sun.*",
                            "sun.*",
                            "org.graalvm.*",
                            "jdk.internal.*"
                        }
                    },
                    sources = {
                        organizeImports = {
                            starThreshold = 9999,
                            staticStarThreshold = 9999,
                        },
                    },
                },
            }
        }
    }
end

return M
