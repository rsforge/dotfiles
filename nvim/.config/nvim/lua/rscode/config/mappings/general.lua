return {
	['ni'] = {
		['<left>'] = { '<nop>', 'Remap arrow keys to no-operation' },
		['<down>'] = { '<nop>', 'Remap arrow keys to no-operation' },
		['<up>'] = { '<nop>', 'Remap arrow keys to no-operation' },
		['<right>'] = { '<nop>', 'Remap arrow keys to no-operation' },
	},
	['n'] = {
		['<leader>'] = {
			['w'] = { '<cmd>w!<cr>', 'Save File' },
			['q'] = { '<cmd>q!<cr>', 'Save File' },
            ['j'] = {
                function()
                    local neovault = require('neovault')
                    neovault.set_active('window')
                    neovault.run('get')
                end,
                'Window Jump'
            },
            ['J'] = {
                function()
                    local neovault = require('neovault')
                    neovault.set_active('window')
                    neovault.run('set')
                end,
                'Window Jump'
            },
            ['r'] = {
                ['b'] = { '<cmd>cexpr system("./tools/build.sh debug")<cr>', 'Build (debug)' },
                ['c'] = { '<cmd>!./tools/configure.sh debug<cr>', 'Configure (debug)' },
                ['r'] = { '<cmd>!./tools/run.sh debug<cr>', 'Run (debug)' },
                ['a'] = { '<cmd>!./tools/build.sh debug && ./tools/run.sh debug<cr>', 'Build & Run (debug)' },
                ['B'] = { '<cmd>cexpr system("./tools/build.sh release")<cr>', 'Build (release)' },
                ['C'] = { '<cmd>!./tools/configure.sh release<cr>', 'Configure (release)' },
                ['R'] = { '<cmd>!./tools/run.sh release<cr>', 'Run (release)' },
                ['A'] = { '<cmd>!./tools/build.sh release && ./tools/run.sh release<cr>', 'Build & Run (release)' },
            }
		},
        ['<C-->'] = { '<C-w>s', 'Horizontal split' },
        ['<C-S-\\>'] = { '<C-w>v', 'Vertical split' },

        ['<A-j>'] = { ':m .+1<cr>==', 'Move line down' },
        ['<A-k>'] = { ':m .-2<cr>==', 'Move line down' },

		['j'] = { 'v:count == 0 ? \'gj\' : \'j\'', 'Better down', opts = { expr = true } },
		['k'] = { 'v:count == 0 ? \'gk\' : \'k\'', 'Better down', opts = { expr = true } },
	},
	['i'] = {
		['<A-j>'] = { '<esc>:m .+1<cr>==gi', 'Move line down' },
		['<A-k>'] = { '<esc>:m .-2<cr>==gi', 'Move line down' },

		['<C-h>'] = { '<Left>', 'Move Left' },
		['<C-j>'] = { '<Down>', 'Move Down' },
		['<C-k>'] = { '<Up>', 'Move Up' },
		['<C-l>'] = { '<Right>', 'Move Right' },
	},
	['v'] = {
		['<lt>'] = { '<gv', 'Keep selection after Indentation' },
		['>'] = { '>gv', 'Keep selection after Indentation' },

		['<A-j>'] = { ':m \'>+1<cr>gv=gv', 'Move line down' },
		['<A-k>'] = { ':m \'<-2<cr>gv=gv', 'Move line down' },
		['p'] = { '"_dP', 'Better paste' }
	},
	['x'] = {
		['j'] = { 'v:count == 0 ? \'gj\' : \'j\'', 'Better down', opts = { expr = true } },
		['k'] = { 'v:count == 0 ? \'gk\' : \'k\'', 'Better down', opts = { expr = true } },
	},
    ['t'] = {
		['<C-h>'] = { '<cmd>wincmd h<cr>', 'Move Left' },
		['<C-j>'] = { '<cmd>wincmd j<cr>', 'Move Down' },
		['<C-k>'] = { '<cmd>wincmd k<cr>', 'Move Up' },
		['<C-l>'] = { '<cmd>wincmd l<cr>', 'Move Right' },

		['<C-Left>'] = { '<cmd>vertical resize -2<cr>', 'Resize window width' },
		['<C-Down>'] = { '<cmd>resize -2<cr>', 'Resize window height' },
		['<C-Up>'] = { '<cmd>resize +2<cr>', 'Resize window height' },
		['<C-Right>'] = { '<cmd>vertical resize +2<cr>', 'Resize window width' },
    },
}
