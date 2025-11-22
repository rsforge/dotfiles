local M = {}

function M.options()
    return {
        scope = {
            enabled = true,
            show_start = false,
            show_end = false,
        },
        exclude = {
            filetypes = { 'norg' },
        }
    }
end

function M.init()

end

function M.config()
    local options = M.options()
    local ibl = require('ibl')

    ibl.setup(options)
end

return M
