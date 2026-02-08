-- ============================================================================
-- Mini Starter (Start Screen) Configuration
-- ============================================================================
-- Mini.starter provides a customizable start screen that appears when Neovim
-- opens with no files. It can display quick actions, recent files, and custom
-- commands. This replaces the default Neovim start screen.

return {
    {
        'echasnovski/mini.starter',
        version = '*',
        event = "VimEnter", -- Load on startup
        -- Use opts as a function for dynamic values (Lazy best practice)
        opts = function()
            return {
                -- Personalized header greeting
                header = "Hey, " .. os.getenv("USER") .. "!",
                -- Footer with current date
                footer = os.date("%A | %B %d"),
                -- Custom quick action items
                items = {
                    {
                        action = function()
                            -- Open Google Calendar in browser
                            os.execute("xdg-open 'https://calendar.google.com/calendar/u/0/r' &> /dev/null &")
                        end,
                        name = "Open Calendar",
                        section = "Quick Links"
                    },
                    {
                        action = function()
                            -- Launch Mailspring email client
                            os.execute("mailspring &> /dev/null &")
                        end,
                        name = "Open Mailspring",
                        section = "Quick Links"
                    },
                },
            }
        end,
    },
}
