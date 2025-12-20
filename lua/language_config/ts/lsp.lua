M = {}

M.configure = function(capabilities)
    vim.lsp.config.ts_ls = {
        capabilities = capabilities,
    }
end

return M
