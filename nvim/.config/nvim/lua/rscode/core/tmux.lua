local M = {}

function M.options()
    return {
        navigation = {
            cycle_navigation = false,
            enable_default_keybindings = false,
        },
        resize = {
            enable_default_keybindings = false,
            resize_step_x = 2,
            resize_step_y = 2,
        }
    }
end

function M.init()
    local mappings = require('rscode.config.mappings.tmux')
    require('rscode.utils.mapping').load(mappings, {})
end

function M.config()
    local options = M.options()
    local tmux = require('tmux')

    tmux.setup(options)
end

return M
