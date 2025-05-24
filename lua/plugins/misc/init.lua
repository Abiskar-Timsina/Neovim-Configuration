return {
    -- Comment out lines
    {
        'echasnovski/mini.comment',
        version = '*',
        config = function()
            local comments = require("mini.comment")
            comments.setup({
                mappings = {
                    comment_line = "<leader>/",
                    comment_visual = "/",
                }
            })
        end
    },
    -- Insert symbols as pairs
    {
        'echasnovski/mini.pairs',
        version = '*',
        config = function()
            local pairs = require("mini.pairs")
            pairs.setup({})
        end
    },
    -- Visualize Indentation
    {
        'echasnovski/mini.indentscope',
        version = '*',
        config = function()
            local indentscope = require("mini.indentscope")
            indentscope.setup({})
        end
    },
    -- Icons
    {
        'echasnovski/mini.icons',
        version = '*',
        config = function()
            local icons = require("mini.icons")
            icons.setup({})
        end
    },
    -- Surround text.
    {
        'echasnovski/mini.surround',
        version = '*',
        config = function()
            local surround = require("mini.surround")
            surround.setup({
                -- Using a to initiate surround since I use `s` to replace in-place and don't really use a
                mappings = {
                    add = 'aa',            -- Add surrounding in Normal and Visual modes
                    delete = 'ad',         -- Delete surrounding
                    find = 'af',           -- Find surrounding (to the right)
                    find_left = 'aF',      -- Find surrounding (to the left)
                    highlight = 'ah',      -- Highlight surrounding
                    replace = 'ar',        -- Replace surrounding
                    update_n_lines = 'an', -- Update `n_lines`
                }
            })
        end
    }
}
