-- Schedule re-ocurring tasks using timers

local timer = vim.loop.new_timer()
-- :start Starts a libuv timer (Neovim’s underlying async/event loop system). :start(initial_delay, interval between runs, callback)
-- schedule_wrap Wraps your callback function so that it runs safely inside Neovim’s main event loop.
timer:start(0, 200, vim.schedule_wrap(function()
    -- checktime tells Neovim to check if any buffers have changed outside of Neovim
    vim.cmd('silent! checktime')
end))
