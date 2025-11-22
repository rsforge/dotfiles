local M = {}

function M.options()
    return {
        mode = 'words', -- words, phrases
        winlayout = 'responsive',
        kblayout = {
            { "'", ',', '.', 'p', 'y', 'f', 'g', 'c', 'r', 'l' },
            { 'a', 'o', 'e', 'u', 'i', 'd', 'h', 't', 'n', 's' },
            { ';', 'q', 'j', 'k', 'x', 'b', 'm', 'w', 'v', 'z' },
        },
        wpm_goal = 80,
        numbers = true,
        symbols = true,
        random = false,
        phrases = nil, -- can be a table of strings
        insert_on_start = false,
        stats_filepath = vim.fn.stdpath 'data' .. '/typrstats',
        mappings = nil,
        -- or function(buf) end
        -- mappings = function(buf)
        --  vim.keymap.set('n', 'a, anything, { buffer = buf })
        -- end,
        on_attach = nil,
        -- or function(buf) end
        -- on_attach = function(buf)
        --  vim.b[buf].minipairs_disable = true
        -- end,end
    }
end

function M.init()

end

function M.config()
    local options = M.options()
    local typr = require('typr')

    typr.setup(options)
end

return M
