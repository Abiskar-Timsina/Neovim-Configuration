local M = {}

M.configure = function(capabilities)
    vim.lsp.config.terraformls = {
        capabilities = capabilities,
        filetypes = {"tf", "terraform","terraform-vars"},
        settings = {
          terraformls = {
            ignoreSingleFileWarning = true,
          }
        }
    }
end

return M

