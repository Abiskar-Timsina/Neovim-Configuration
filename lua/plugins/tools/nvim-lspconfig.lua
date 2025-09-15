-- NOTE: Allows nifty key actions, such as docs on hover and such
--`:h vim.lsp.buf`

-- WARN: don't use the mappings for vim buffer's (doesn't work propery) instead use autocmd groups
-- mappings = {
--         {'K', vim.lsp.buf.hover, desc="Display information about symbol under cursor"},
--         {'gd', vim.lsp.buf.definition, desc="Goto the definition"},
-- }
return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require("language_config.go.lsp").configure(lspconfig, capabilities)
        require("language_config.lua.lsp").configure(lspconfig, capabilities)
        require("language_config.php.lsp").configure(lspconfig, capabilities)
        require("language_config.python3.lsp").configure(lspconfig, capabilities)
        require("language_config.ts.lsp").configure(lspconfig, capabilities)
        require("language_config.c.lsp").configure(lspconfig, capabilities)
    end,
}
