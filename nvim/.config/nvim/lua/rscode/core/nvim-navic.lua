local M = {}

function M.options()
    return {}
end

function M.init()

end

function M.config()
    local options = M.options()
    local navic = require('nvim-navic')

    navic.setup(options)
end

return M
