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
                -- for lua
                "lua_ls",
                -- for php
                "intelephense",
                -- for c/cpp
                "clangd",
                -- for golang
                "gopls",
            },
            -- WARN: Since I have a config for nvim-lspconfig where I'm manually attaching
            -- each instance, turning this on will case issues such as the virtual text 
            -- appearing multiple times and multiple attachments to a single buffer.
            automatic_enable = false,
        })
    end
}
