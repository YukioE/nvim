return {
    {
        'zbirenbaum/copilot.lua',
        cmd = 'Copilot',
        event = 'InsertEnter',
        config = function()
            require('copilot').setup {
                panel = { enabled = false },
                suggestion = {
                    keymap = {
                        accept = '<C-CR>',
                    },
                    hide_during_completion = false,
                    auto_trigger = true,
                },
            }
        end,
    },

    {
        'zbirenbaum/copilot-cmp',
        after = { 'copilot.lua' },
        config = function()
            require('copilot_cmp').setup()
        end,
    },
}
