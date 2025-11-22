local M = {}

function M.options()
    return {
        underline = false,
        virtual_text = false,
        virtual_lines = true,
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = ' ',
                [vim.diagnostic.severity.WARN] = ' ',
                [vim.diagnostic.severity.INFO] = ' ',
                [vim.diagnostic.severity.HINT] = ' ',
            },
            numhl = {
                [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
                [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
                [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
                [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
            },
            -- linehl = {
            --     [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            --     [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            --     [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
            --     [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
            -- },
        },
        severity_sort = true,
        update_in_insert = false,
    }
end

function M.init()

end

function M.config()
    local options = M.options()
    local lspconfig = require('lspconfig')
    local lsp_mappings = require('rscode.config.mappings.lsp')
    local mapping = require('rscode.utils.mapping')
    local navic = require('nvim-navic')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    local on_attach_navic = function(client, bufnr)
        mapping.load(lsp_mappings, { buffer = bufnr })
        navic.attach(client, bufnr)
    end
    local on_attach = function(client, bufnr)
        mapping.load(lsp_mappings, { buffer = bufnr })
    end

    local capabilities = vim.tbl_deep_extend(
        'force',
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_nvim_lsp.default_capabilities()
    )

    vim.diagnostic.config(options)

    vim.lsp.config('*', {
        capabilities = capabilities,
        on_attach = on_attach_navic,
    })

    vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        on_attach = on_attach_navic,
        settings = {
            Lua = {
                diagnostics = {
                    globals = {
                        'vim'
                    },
                },
            }
        }
    })

    vim.lsp.config('clangd', {
        capabilities = capabilities,
        on_attach = on_attach_navic,
        cmd = {
            'clangd',
            '--clang-tidy',
            '--background-index',
            '--offset-encoding=utf-8',
        },
        root_markers = { '.clangd', 'compile_commands.json' },
        filetypes = { 'c', 'cpp' },
    })
end

return M
