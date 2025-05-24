M = {}

M.configure = function(lspconfig, capabilities)
    lspconfig.lua_ls.setup({
        capabilities = capabilities
    })
end

return M
