local M = {}

function M.options()
    return {}
end

function M.init()

end

function M.config()
    local options = M.options()
    local hex = require('hex')

    hex.setup(options)
end

return M
