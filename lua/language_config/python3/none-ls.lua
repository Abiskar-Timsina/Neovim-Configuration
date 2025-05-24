--WARN: It seems that the folks at none-ls moved some of the builtins to this other repo
-- https://github.com/nvimtools/none-ls-extras.nvim and flake8 was one of those builtins
M = {}

M.formatting = function (formatting)
    return require("none-ls.formatting.autopep8")
end

M.diagnostics = function (diagnostics)
    return require("none-ls.diagnostics.flake8")
end

return M
