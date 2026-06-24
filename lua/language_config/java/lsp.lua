M = {}

M.configure = function(capabilities)
    vim.lsp.config.jls = {
        capabilities = capabilities
    }
end

return M
