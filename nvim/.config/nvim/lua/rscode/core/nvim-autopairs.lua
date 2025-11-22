local M = {}

function M.options()
    return {}
end

function M.init()

end

function M.config()
    local options = M.options()
    local autopairs = require('nvim-autopairs')

    autopairs.setup(options)
end

return M
