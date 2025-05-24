M = {}

M.configure = function(lspconfig,capabilities)
    lspconfig.gopls.setup({
        capabilities = capabilities
    })
end

return M
