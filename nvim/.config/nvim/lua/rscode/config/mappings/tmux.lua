return {
    ['n'] = {
        ['<C-h>'] = { function() require('tmux').move_left() end, 'Focus window to the left' },
        ['<C-j>'] = { function() require('tmux').move_bottom() end, 'Focus window below' },
        ['<C-k>'] = { function() require('tmux').move_top() end, 'Focus window above' },
        ['<C-l>'] = { function() require('tmux').move_right() end, 'Focus window to the right' },

        ['<C-Left>']  = { function() require('tmux').resize_left() end, 'Resize window width' },
        ['<C-Down>']  = { function() require('tmux').resize_bottom() end, 'Resize window height' },
        ['<C-Up>']    = { function() require('tmux').resize_top() end, 'Resize window height' },
        ['<C-Right>'] = { function() require('tmux').resize_right() end, 'Resize window width' },
    }
}
