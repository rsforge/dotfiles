local M = {}

function M.options()
    return {
        default_file_explorer = true,
        columns = {
            'icon',
        },
        buf_options = {
            buflisted = false,
            bufhidden = 'hide',
        },
        win_options = {
            wrap = false,
            signcolumn = 'no',
            cursorcolumn = false,
            foldcolumn = '0',
            spell = false,
            list = false,
            conceallevel = 3,
            concealcursor = 'nvic',
        },
        delete_to_trash = true,
        ship_confirm_for_simple_edits = true,
        prompt_save_on_select_new_entry = true,
        cleanup_delay_ms = 2000,
        lsp_file_methods = {
            autosave_changes = false,
        },
        constrain_cursor = 'editable',
        keymaps = {
        },
        use_default_keymaps = true,
        view_options = {
            show_hidden = true,
            is_hidden_file = function(name, _)
                return vim.startswith(name, '.')
            end,
            is_always_hidden = function(_, _)
                return false
            end,
            sort = {
                { 'type', 'asc' },
                { 'name', 'asc' },
            },
        },
        float = {
            padding = 4,
            max_width = 0,
            max_height = 0,
            border = 'rounded',
            win_options = {
                winblend = 0,
            },
            override = function(conf)
                return conf
            end,
        },
        preview = {
            max_width = 0.9,
            min_width = { 40, 0.4 },
            width = nil,
            max_height = 0.9,
            min_height = { 5, 0.4 },
            height = nil,
            border = 'rounded',
            win_options = {
                winblend = 0,
            },
            update_on_cursor_moved = true,
        },
        progress = {
            max_width = 0.9,
            min_width = { 40, 0.4 },
            width = nil,
            max_height = 0.9,
            min_height = { 5, 0.1 },
            height = nil,
            border = 'rounded',
            minimized_border = 'none',
            win_options = {
                winblend = 0,
            },
        },
    }
end

function M.init()
    local mappings = require('rscode.config.mappings.file-explorer').oil or {}
    require('rscode.utils.mapping').load(mappings)
end

function M.config()
    local options = M.options()
    local oil = require('oil')

    oil.setup(options)
end

return M
