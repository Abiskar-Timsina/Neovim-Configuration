M = {}

M.configure = function(lspconfig, capabilities)
    lspconfig.clangd.setup({
        capabilities = capabilities
    })
end

return M
