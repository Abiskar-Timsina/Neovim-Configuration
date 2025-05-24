return {
    --NOTE: Linters, formatters aren't exactly LSP but rather command line tools,
    -- this is where none-ls comes in, it wraps the tools with the LSP.

    --WARN: It seems that the folks at none-ls moved some of the builtins to this other repo 
    -- https://github.com/nvimtools/none-ls-extras.nvim and flake8 was one of those builtins
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- WARN: Since, none-ls is a null-ls fork, it's still called using null-ls
        local null_ls = require("null-ls")         -- this is built null ls interface
        local formatting = null_ls.builtins.formatting -- this is for formatters only
        local diagnostics = null_ls.builtins.diagnostics -- this is the interface for diagnostic tools

        -- chekout null-ls / builtins in github
        local sources = {
            require("none-ls.diagnostics.flake8"),
            require("none-ls.formatting.autopep8"),
            formatting.phpcsfixer,
            formatting.goimports,
            formatting.prettier,
        }

        -- setting up the null ls
        null_ls.setup({
            sources = sources,
        })
    end,
}
