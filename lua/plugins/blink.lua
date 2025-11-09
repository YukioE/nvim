return {
    {
        'saghen/blink.cmp',
        event = 'InsertEnter',
        version = '1.*',
        dependencies = {
            'fang2hou/blink-copilot',
            'rafamadriz/friendly-snippets',
            {
                'L3MON4D3/LuaSnip',
                build = (function()
                    if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                        return
                    end
                    return 'make install_jsregexp'
                end)(),
                config = function()
                    require('luasnip.loaders.from_vscode').lazy_load()
                end,
            },
        },
        opts = {
            keymap = {
                preset = 'enter',

                ['<Tab>'] = { 'select_next', 'fallback' },
                ['<S-Tab>'] = { 'select_prev', 'fallback' },
            },
            appearance = { nerd_font_variant = 'mono' },
            completion = {
                documentation = { auto_show = true },
                menu = {
                    draw = {
                        columns = {
                            { 'kind_icon', gap = 1 },
                            { 'label', 'label_description', gap = 1 },
                            { 'kind', gap = 1 },
                        },
                    },
                },
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
                providers = {
                    copilot = {
                        name = 'copilot',
                        module = 'blink-copilot',
                        score_offset = 100,
                        async = true,
                        opts = {
                            max_completions = 2,
                            auto_refresh = {
                                backward = true,
                                forward = true,
                            },
                        },
                    },
                },
            },
            fuzzy = { implementation = 'prefer_rust_with_warning' },
            signature = { enabled = true },
        },
        opts_extend = { 'sources.default' },
    },

    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp' },
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            local lspconfig = require 'lspconfig'

            lspconfig.lua_ls.setup { capabilities = capabilities }
            lspconfig.tsserver.setup { capabilities = capabilities }
            -- add any other LSP servers here
        end,
    },
}
