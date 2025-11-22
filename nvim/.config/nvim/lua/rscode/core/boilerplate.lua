local M = {}

function M.options()
    return {}
end

function M.init()

end

function M.config()
    local options = M.options()
    local plugin = require('')

    plugin.setup(options)
end

return M
