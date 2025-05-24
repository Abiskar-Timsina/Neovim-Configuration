--NOTE: Linters, formatters aren't exactly LSP but rather command line tools,
-- this is where none-ls comes in, it wraps the tools with the LSP.
return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- WARN: Since, none-ls is a null-ls fork, it's still called using null-ls
        local null_ls = require("null-ls")               -- this is built null ls interface
        local formatting = null_ls.builtins.formatting   -- this is for formatters only
        local diagnostics = null_ls.builtins.diagnostics -- this is the interface for diagnostic tools


        -- setting up the null ls
        -- chekout none-ls / builtins in github
        null_ls.setup({
            sources = {
                require("language_config.go.none-ls").formatting(formatting),
                require("language_config.php.none-ls").formatting(formatting),
                require("language_config.python3.none-ls").formatting(formatting),
                require("language_config.python3.none-ls").diagnostics(diagnostics),
                require("language_config.ts.none-ls").formatting(formatting),
            }
            ,
        })
    end,
}
