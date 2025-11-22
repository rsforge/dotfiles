local M = {}

function M.options()
    return {}
end

function M.init()

end

function M.config()
    local options = M.options()
    local neodev = require('neodev')

    neodev.setup(options)
end

return M
