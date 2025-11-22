local M = {}

function M.options()
    return {
        ui = {
            border = 'rounded',
            icons = {
                package_installed   = '󰧞',
                package_pending     = '󰻃',
                package_uninstalled = '󰝦',
            }
        }
    }
end

function M.init()

end

function M.config()
    local options = M.options()
    local mason = require('mason')

    mason.setup(options)
end

return M
