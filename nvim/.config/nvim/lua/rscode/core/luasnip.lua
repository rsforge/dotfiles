local M = {}

function M.options()
    return {}
end

function M.init()

end

function M.config()
    local options = M.options()
    local luasnip = require('luasnip')

    luasnip.setup(options)
end

return M
