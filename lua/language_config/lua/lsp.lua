M = {}

M.configure = function(capabilities)
    vim.lsp.config.lua_ls = {
        capabilities = capabilities
    }
end

return M
