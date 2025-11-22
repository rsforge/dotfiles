local M = {}

function M.options()
    return {}
end

function M.init()

end

function M.config()
    local options = M.options()
    local surround = require('nvim-surround')

    surround.setup(options)
end

return M
