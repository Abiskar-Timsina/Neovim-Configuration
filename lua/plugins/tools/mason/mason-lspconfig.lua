-- NOTE: Helps bridge the gap between mason and nvim lspconfig, has a very useful `ensure_installed` property.
return {
    "williamboman/mason-lspconfig.nvim",

    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        { "neovim/nvim-lspconfig" }
    },

    config = function()
        local lsp_config = require("mason-lspconfig")
        lsp_config.setup({
            ensure_installed = {
                -- for php
                "intelephense",
                -- for c/cpp
                "clangd",
                -- for golang
                "gopls",
            },
            automatic_enable = true,
        })
    end
}
