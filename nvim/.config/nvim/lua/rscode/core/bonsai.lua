local M = {}

function M.options()
    return {}
end

function M.init()
    vim.opt.rtp:append('/home/riverwc/dev/nvim/rsforge/bonsai.nvim')
end

function M.config()
    local options = M.options()
    local bonsai = require('bonsai')

    bonsai.setup(options)
end

return M
