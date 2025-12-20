M = {}

M.configure = function(capabilities)
    vim.lsp.config.gopls = {
        capabilities = capabilities
    }
end

return M
