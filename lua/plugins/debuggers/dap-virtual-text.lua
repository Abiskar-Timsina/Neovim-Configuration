--NOTE: Virtual Text has some hard dependencies, for example this won't show up
-- unless you have the correct TS parser installed.
return {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
        require("nvim-dap-virtual-text").setup {
            enabled = true,
            enabled_commands = true,
            commented = false, -- Show the virtual text as comments
            only_first_definition = false,
            all_references = true,
        }
    end
}
