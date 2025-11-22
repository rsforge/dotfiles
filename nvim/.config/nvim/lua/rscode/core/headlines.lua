local M = {}

function M.options()
    return {
        norg = {
            bullets = {},
            fat_headlines = function()
                local is_toc_file = (vim.bo.filetype == 'norg' and vim.bo.buftype == 'nofile')
                return not is_toc_file
            end,
        }
    }
end

function M.init()
    vim.opt.rtp:append('/home/riverwc/headlines.nvim')
end

function M.config()
    local options = M.options()
    local headlines = require('headlines')
    headlines.setup()

    vim.api.nvim_create_autocmd('BufEnter', {
        pattern = '*.norg',
        callback = function(ev)
            require('headlines').attach(ev.buf, { bullets = {} })
        end
    })
end

return M
