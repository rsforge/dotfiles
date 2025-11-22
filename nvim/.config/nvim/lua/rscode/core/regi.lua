local M = {}

function M.options()
    return {}
end

function M.init()
    vim.opt.rtp:append('/home/riverwc/dev/nvim/rsforge/regi.nvim')
end

function M.config()
    local options = M.options()
    local neovault = require('regi')
    --
    -- -- neovault.setup(options)
    --
    -- local vault = neovault.create_vault('window', {}):load()
    -- vault:new_action('get', function(contents)
    --     vim.api.nvim_set_current_win(contents)
    -- end)
    -- vault:new_action('set', function(_)
    --     return vim.api.nvim_get_current_win()
    -- end)
    --
    -- vim.api.nvim_create_autocmd('VimLeave', {
    --     callback = function()
    --         vault:save()
    --     end
    -- })
    --
    -- local regi = require('regi')
    -- regi.setup({})
    --
    -- regi.register:new({})
end

return M
