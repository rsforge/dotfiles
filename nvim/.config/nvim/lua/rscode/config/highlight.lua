local M = {}

function M.load()
    local colors = require('tokyonight.colors').setup()
    --local utils  = require('tokyonight.util')

    --------------------------------------------------
    -- nvim-cmp                                     --
    --------------------------------------------------
    vim.api.nvim_set_hl(0, 'CmpBorder', { fg = colors.comment, bg = colors.bg })
    vim.api.nvim_set_hl(0, 'CmpDocBorder', { fg = colors.comment, bg = colors.bg })

    vim.api.nvim_set_hl(0, 'CmpPmenu', { fg = colors.fg, bg = colors.bg })
    vim.api.nvim_set_hl(0, 'CmpCursor', { fg = colors.bg_dark, bg = colors.blue, bold = true })
end

return M
