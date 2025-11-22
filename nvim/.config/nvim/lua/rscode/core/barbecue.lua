local M = {}

function M.options()
    return {}
end

function M.init()

end

function M.config()
    local options = M.options()
    local barbecue = require('barbecue')

    barbecue.setup(options)
end

return M
