M = {}

M.load_options = function()
    local files = {
        "command-groups",
        "mappings",
        "schedule",
        "general-options",
        "timers",
    }

    for _, eachFile in ipairs(files) do
        local modulePath = "startup.options." .. eachFile
        local success, err = pcall(require, modulePath)
        if not success then
            vim.notify("Couldn't load " .. modulePath)
        end
    end
end

return M
