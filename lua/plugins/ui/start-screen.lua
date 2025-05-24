return {
    {
        'echasnovski/mini.starter',
        version = '*',
        config = function()
            local startScreen = require("mini.starter")
            startScreen.setup({
                header = "Hey, " .. os.getenv("USER") .. "!",
                footer = os.date("%A | %B %d"),
                items = {
                    {
                        action = function()
                            os.execute("xdg-open 'https://calendar.google.com/calendar/u/0/r' &> /dev/null &")
                        end,
                        name = "Open Calander",
                        section = "Quick Links"
                    },
                    {
                        action = function()
                            os.execute("mailspring &> /dev/null &")
                        end,
                        name = "Open Mailspring",
                        section = "Quick Links"
                    },
                },
            })
        end
    },
}
