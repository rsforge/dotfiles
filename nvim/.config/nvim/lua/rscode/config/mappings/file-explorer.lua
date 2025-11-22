local mappings = {}

mappings.oil = {
    ['n'] = {
        ['<leader>'] = {
            ['e'] = { function() require('oil').toggle_float() end, 'File Explorer' },
        },
    },
}

return mappings
