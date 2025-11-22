local M = {}

function M.options()
    return {
        override = {};
        color_icons = true;
        default = false;
        strict = true;
        variant = "dark";
        override_by_filename = {};
        override_by_extension = {
            ["tpp"] = {
                icon = "",
                color = "#519ABA",
                cterm_color = "74",
                name = "Tpp"
            },
        };
        override_by_operating_system = {
        };
    }
end

function M.init()

end

function M.config()
    local options = M.options()
    local devicons = require('nvim-web-devicons')

    devicons.setup(options)
end

return M
