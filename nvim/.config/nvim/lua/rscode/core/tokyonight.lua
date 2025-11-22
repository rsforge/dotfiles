local M = {}

function M.options()
    return {}
end

function M.init()
end

function M.config()
    local options = M.options()
    local tokyonight = require('tokyonight')

    tokyonight.setup(options)

    vim.cmd('colorscheme tokyonight-moon')

    require('rscode.config.highlight').load()
end

return M
