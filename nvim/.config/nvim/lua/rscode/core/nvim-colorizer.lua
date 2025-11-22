local M = {}

function M.options()
    return {
        filetypes = { '*' },
        user_default_options = {
            RGB = true,
            RRGGBB = true,
            names = false,
            RRGGBBAA = false,
            AARRGGBB = false,
            rgb_fn = false,
            hsl_fn = false,
            css = false,
            css_fn = false,
            mode = 'background',
            tailwind = false,
            sass = { enable = false, parsers = { 'css' }, },
            virtualtext = '■',
            always_update = false
        },
        buftypes = {},
    }
end

function M.init()

end

function M.config()
    local options = M.options()
    local colorizer = require('colorizer')

    colorizer.setup(options)
end

return M
