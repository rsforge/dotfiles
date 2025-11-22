local M = {}

function M.options()
    return {}
end

function M.init()

end

function M.config()
    local options = M.options()
    local comment = require('Comment')

    comment.setup(options)
end

return M
