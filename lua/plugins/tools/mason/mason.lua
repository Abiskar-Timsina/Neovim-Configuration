-- NOTE: mason actually installs all our LSPs, Debuggers, Linters etc
return {
    "williamboman/mason.nvim",
    config = function()
        local mason = require("mason")
        mason.setup({
            ui = {
                check_outdated_packages_on_open = true,
                backdrop = 80,
            }
        })
    end,
}
