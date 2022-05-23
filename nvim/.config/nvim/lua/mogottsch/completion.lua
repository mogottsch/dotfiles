local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ['<CR>'] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

    }),
    sources = cmp.config.sources({
        {name = 'nvim_lua'}, {name = 'nvim_lsp'}, {name = 'path'},
        {name = 'treesitter'}, {name = 'luasnip'}
    }, {{name = 'buffer'}}),
    formatting = {
        format = function(entry, vim_item)
            -- print(vim.inspect(vim_item.kind))
            if cmp_kind == nil then
                cmp_kind = require("navigator.lspclient.lspkind").cmp_kind
            end
            vim_item.kind = cmp_kind(vim_item.kind)
            vim_item.menu = ({
                buffer = " ﬘",
                nvim_lsp = " ",
                luasnip = " ",
                treesitter = " "
            })[entry.source.name]
            return vim_item
        end
    }
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {{name = 'buffer'}},
    mapping = cmp.mapping.preset.insert()
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}}),
    mapping = cmp.mapping.preset.insert()
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp
                                                                     .protocol
                                                                     .make_client_capabilities())
require("luasnip.loaders.from_vscode").lazy_load()
