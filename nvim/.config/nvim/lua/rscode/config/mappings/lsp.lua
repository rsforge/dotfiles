return {
    ['n'] = {
        ['g'] = {
            ['d'] = { vim.lsp.buf.definition, 'Goto Definition' },
            ['D'] = { vim.lsp.buf.declaration, 'Goto Declaration' },
            ['r'] = { vim.lsp.buf.references, 'References' },
            ['i'] = { vim.lsp.buf.implementation, 'Goto Implementation' },
        },
        -- ['K'] = { vim.lsp.buf.hover, 'Hover' }
    }
}
