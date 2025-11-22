local M = {}

function M.options()
    return {
        default_mapping = true,
        timeout = 200,
    }
end

function M.init()

end

function M.config()
    local options = M.options()
    local better_escape = require('better_escape')

    better_escape.setup(options)
end

return M
