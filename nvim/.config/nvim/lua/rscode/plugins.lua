return {
    --------------------------------------------------
    -- Miscellaneous                                --
    --------------------------------------------------
    'nvim-lua/plenary.nvim',
    {
        "nvim-tree/nvim-web-devicons",
        config = require('rscode.core.nvim-web-devicons').config
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        config = require('rscode.core.indent-blankline').config,
    },
    {
        'max397574/better-escape.nvim',
        event = { 'InsertEnter' },
        config = require('rscode.core.better-escape').config,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        cmd = { 'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
        event = { 'BufReadPre', 'BufNewFile' },
        build = ':TSUpdate',
        config = require('rscode.core.nvim-treesitter').config,
    },
    {
        'numToStr/Comment.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        config = require('rscode.core.comment').config,
    },
    {
        'windwp/nvim-autopairs',
        event = { 'InsertEnter' },
        config = require('rscode.core.nvim-autopairs').config,
    },
    {
        'kylechui/nvim-surround',
        event = { 'InsertEnter' },
        config = require('rscode.core.nvim-surround').config,
    },
    -- {
    --     'vijaymarupudi/nvim-fzf',
    --     config = require('rscode.core.nvim-fzf'),
    -- },
    {
        'nvzone/typr',
        dependencies = 'nvzone/volt',
        opts = {},
        cmd = { 'Typr', 'TyprStats' },
        config = require('rscode.core.typr')
    },

    --------------------------------------------------
    -- Neovim Development                           --
    --------------------------------------------------
    {
        'folke/neodev.nvim',
        config = require('rscode.core.neodev').config,
    },

    --------------------------------------------------
    -- File Explorer                                --
    --------------------------------------------------
    {
        'stevearc/oil.nvim',
        tag = 'v2.8.0',
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        cmd = { 'Oil' },
        init = require('rscode.core.oil').init,
        config = require('rscode.core.oil').config,
    },

    --------------------------------------------------
    -- Status line                                  --
    --------------------------------------------------
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = require('rscode.core.lualine').config,
    },
    {
        'SmiteshP/nvim-navic',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = require('rscode.core.nvim-navic').config,
    },
    {
        'utilyre/barbecue.nvim',
        dependencies = { 'SmiteshP/nvim-navic', 'nvim-tree/nvim-web-devicons' },
        config = require('rscode.core.barbecue').config,
    },

    --------------------------------------------------
    -- Colorschemes/Highlights                      --
    --------------------------------------------------
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        config = require('rscode.core.tokyonight').config,
    },
    {
        'NvChad/nvim-colorizer.lua',
        event = { 'BufReadPre', 'BufNewFile' },
        config = require('rscode.core.nvim-colorizer').config,
    },

    --------------------------------------------------
    -- LSP (Language Server Protocol)               --
    --------------------------------------------------
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            { url = 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' },
            'folke/neodev.nvim',
            'nvim-tree/nvim-web-devicons',
            'SmiteshP/nvim-navic',
            'utilyre/barbecue.nvim',
        },
        event = { 'BufReadPre', 'BufNewFile', 'BufWritePost' },
        config = require('rscode.core.lspconfig').config,
    },

    --------------------------------------------------
    -- Mason                                        --
    --------------------------------------------------
    {
        'williamboman/mason.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        cmd = {
            'Mason',
            'MasonUpdate',
            'MasonInstall',
            'MasonUninstall',
            'MasonUninstallAll',
            'MasonLog',
        },
        config = require('rscode.core.mason').config,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        cmd = { 'LspInstall', 'LspUninstall' },
        config = require('rscode.core.mason-lspconfig').config,
    },
    {
        'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
        config = require('rscode.core.lsp_lines').config,
    },

    --------------------------------------------------
    -- Neorg                                        --
    --------------------------------------------------
    {
        'vhyrro/luarocks.nvim',
        priority = 1000,
        config = true,
    },
    --{
    --    'lukas-reineke/headlines.nvim',
    --    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    --    config = require('rscode.core.headlines').config,
    --},
    {
        'nvim-neorg/neorg',
        dependencies = { 'vhyrro/luarocks.nvim', 'lukas-reineke/headlines.nvim' },
        cmd = { 'Neorg' },
        ft = { 'norg' },
        config = require('rscode.core.neorg').config,
    },

    --------------------------------------------------
    -- Code Completion                              --
    --------------------------------------------------
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            'windwp/nvim-autopairs',
        },
        event = { 'InsertEnter', 'CmdlineEnter' },
        config = require('rscode.core.nvim-cmp').config,
    },
    {
        'L3MON4D3/LuaSnip',
        build = "make install_jsregexp",
        config = require('rscode.core.luasnip').config,
    },

    --------------------------------------------------
    -- Tmux                                         --
    --------------------------------------------------
    {
        'aserowy/tmux.nvim',
        lazy = false,
        init = require('rscode.core.tmux').init,
        config = require('rscode.core.tmux').config,
    },

    --------------------------------------------------
    -- Hex                                          --
    --------------------------------------------------
    -- {
    --     'RaafatTurki/hex.nvim',
    --     lazy = false,
    --     config = require('rscode.core.hex'),
    -- },

    --------------------------------------------------
    -- Dev Plugins                                  --
    --------------------------------------------------
    --{
    --    'rsforge/bonsai.nvim',
    --    dir = '/home/riverwc/dev/nvim/rsforge/bonsai.nvim',
    --    dev = true,
    --    lazy = false,
    --    init = require('rscode.core.bonsai').init,
    --    config = require('rscode.core.bonsai').config,
    --},
    -- {
    --    'rsforge/regi.nvim',
    --    dir = '/home/riverwc/dev/nvim/rsforge/regi.nvim',
    --    dev = true,
    --    lazy = false,
    --    init = require('rscode.core.regi').init,
    --    config = require('rscode.core.regi').config,
    -- },
    -- {
    --     'rsforge/headlines.nvim',
    --     dir = 'home/riverwc/headlines.nvim',
    --     dev = true,
    --     lazy = false,
    --     dependencies = { 'nvim-treesitter/nvim-treesitter' },
    --     init = require('rscode.core.headlines').init,
    --     config = require('rscode.core.headlines').config,
    -- },
}
