return {
    {
        'saghen/blink.cmp',
        event = 'InsertEnter',
        version = '1.*',
        dependencies = {
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
            keymap = { preset = 'enter' },
            appearance = { nerd_font_variant = 'mono' },
            completion = { documentation = { auto_show = true } },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            fuzzy = { implementation = 'prefer_rust_with_warning' },
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
