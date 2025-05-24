-- Number Options
vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.breakindent = true

-- Search Options with '/'
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Tab Behaviour
vim.opt.expandtab = true
vim.opt.smarttab = true

-- Window Options
vim.opt.splitright = false
vim.opt.splitbelow = true

-- TODO: Move to nvim tree conf whereever that is
-- disable netrw (vim's own tree) to replace it with nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable 25-bit Color
vim.opt.termguicolors = true

-- Cursor Options
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.showmode = false -- (Since we add a info bar via plugins)

-- Undo Options
vim.opt.undofile = true -- Creates a persistant undo history file written to disk
-- that remembers undo even after the session's closed.

-- Vim options
vim.opt.updatetime = 500 -- Time (ms) before writing data to swap files, triggering events etc.
vim.opt.mouse = "a" -- enable mouse in all modes
vim.opt.laststatus = 3 -- Uses a global status line

-- Spacing Options
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4   -- Number of spaces for indentation
vim.opt.tabstop = 4      -- Number of spaces per tab
vim.opt.softtabstop = 4  -- Insert/delete spaces for <Tab>
