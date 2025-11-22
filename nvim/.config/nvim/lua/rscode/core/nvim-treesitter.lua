local M = {}

function M.options()
    return {
        ensure_installed = { 'c', 'cpp', 'bash', 'cmake', 'diff', 'fish', 'git_config', 'git_rebase', 'gitattributes', 'gitcommit', 'gitignore', 'glsl', 'json', 'lua', 'luadoc', 'make', 'norg', 'rust', 'tmux', 'toml', 'vim', 'vimdoc' },
        sync_install = false,
        auto_install = true,
        ignore_install = {},
        highlight = {
            enable = true,
            disable = {}, -- table {'c'} or function(lang, buf)
            additional_vim_regex_highlighting = false,
        },
    }
end

function M.init()

end

function M.config()
    local options = M.options()
    local treesitter_config = require('nvim-treesitter.configs')

    treesitter_config.setup(options)
end

return M
