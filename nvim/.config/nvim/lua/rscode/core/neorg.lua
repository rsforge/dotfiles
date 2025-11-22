local M = {}

function M.options()
    return {
        load = {
            ['core.defaults'] = {},
            ['core.concealer'] = {
                config = {
                    icon_preset = 'diamond',
                },
            },
            ['core.keybinds'] = {
                config = {
                    default_keybind = true,
                    neorg_leader = '<leader>',
                },
            },
            ['core.dirman'] = {
                config = {
                    workspaces = {
                        index = '~/notes',
                        dev = '~/dev/notes',
                        study = '~/notes/study'
                    },
                },
            },
            ['core.integrations.treesitter'] = {}
        },
    }
end

function M.init()

end

function M.config()
    local options = M.options()
    local neorg = require('neorg')

    neorg.setup(options)
end

return M
