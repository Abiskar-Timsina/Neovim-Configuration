return {
    require("plugins.ui.start-screen"),
    require("plugins.ui.status-bar"),
    require("plugins.ui.buffer"),
    -- Load the theme at last
    require("plugins.ui.themes.catppuccin")
}
