local M = {}

function M.options()
    return {}
end

function M.init()

end

function M.config()
    --local options = M.options()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local autopairs_cmp = require('nvim-autopairs.completion.cmp')

    cmp.event:on(
        'confirm_done',
        autopairs_cmp.on_confirm_done()
    )

    local function create_border(hl)
        return {
            { "╭", hl },
            { "─", hl },
            { "╮", hl },
            { "│", hl },
            { "╯", hl },
            { "─", hl },
            { "╰", hl },
            { "│", hl },
        }
    end
    local kind_icons = {
        Array         = "",
        Boolean       = "",
        Class         = "",
        Color         = "",
        Constant      = "",
        Constructor   = "",
        Enum          = "",
        EnumMember    = "",
        Event         = "",
        Field         = "",
        File          = "",
        Folder        = "󰉋",
        Function      = "",
        Interface     = "",
        Key           = "",
        Keyword       = "",
        Method        = "",
        Module        = "",
        Namespace     = "",
        Null          = "󰟢",
        Number        = "",
        Object        = "",
        Operator      = "",
        Package       = "",
        Property      = "",
        Reference     = "",
        Snippet       = "",
        String        = "",
        Struct        = "",
        Text          = "",
        TypeParameter = "",
        Unit          = "",
        Value         = "",
        Variable      = "",
    }
    local max_width = 50

    cmp.setup({
        formatting = {
            expandable_indicator = true,
            fields = { 'abbr', 'kind', 'menu' },
            format = function(_, item)
                if max_width ~= 0 and string.len(item.abbr) > max_width then
                    item.abbr = string.sub(item.abbr, 1, max_width - 1) .. ''
                end

                local icon = kind_icons[item.kind]
                item.kind = string.format('%s %s', icon, item.kind)

                return item
            end,
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        window = {
            completion = {
                border = create_border('CmpBorder'),
                winhighlight = 'Normal:CmpPmenu,CursorLine:CmpCursor,Search:None',
                scrollbar = false,
            },
            documentation = {
                border = create_border('CmpDocBorder'),
                winhighlight = 'Normal:CmpPmenu,CursorLine:CmpCursor,Search:None',
                scrollbar = false,
            },
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
            ['<Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end,
            ['<S-Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end,
        }),
        sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer' },
            { name = 'nvim_lua' },
            { name = 'path' }
        }
    })

    cmp.setup.filetype('gitcommit', {
        sources = {
            { name = 'git' },
            { name = 'buffer' },
        }
    })

    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'path' },
            { name = 'cmdline' },
        }
    })
end

return M
