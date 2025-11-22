local M = {}

function M.options()
    return {
        ensure_installed = {
            'asm_lsp',
            'clangd',
            'cmake',
            'ltex_plus',
            'lua_ls',
            'autotools_ls',
            'marksman',
            'pyright',
            'bashls',
            'jsonls',
            'taplo',
            'ts_ls',
            'html',
            'cssls',
            'vimls',
        },
        automatic_installation = false,
    }
end

function M.init()

end

function M.config()
    local options = M.options()
    local mason_lspconfig = require('mason-lspconfig')

    mason_lspconfig.setup(options)
end

return M
