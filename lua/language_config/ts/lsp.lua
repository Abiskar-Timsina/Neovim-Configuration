M = {}

M.configure = function(lspconfig, capabilities)
    lspconfig.ts_ls.setup({
        capabilities = capabilities,
    })
end

return M
