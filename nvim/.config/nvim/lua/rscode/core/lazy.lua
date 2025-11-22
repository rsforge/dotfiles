local M = {}

function M.options()
    local fs = require('rscode.utils.filesystem')
    return {
        root = fs.join_paths(vim.fn.stdpath('data'), 'lazy'),
        state = fs.join_paths(vim.fn.stdpath('state'), 'lazy', 'state.json'),
        lockfile = fs.join_paths(vim.fn.stdpath('state'), 'lazy', 'lazy-lock.json'),
        defaults = {
            lazy = true,
        },
        install = {
            colorscheme = { 'tokyonight' },
        },
        dev = {
            path = '~/dev/nvim',
            patterns = { 'rsforge' },
            fallback = false,
        },
    }
end

function M.init()

end

function M.config()
    local options = M.options()
    local lazy = require('lazy')

    local plugins = require('rscode.plugins')

    lazy.setup(plugins, options)
end

return M
