-- Syntax highlighting
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua" },
            auto_install = false,             -- This auto installs LSPs if not found but, just to keep stuff clean turning this off
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
