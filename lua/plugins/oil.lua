return {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = {
        { 'echasnovski/mini.icons', opts = {} },
    },
    keys = {
        {
            '\\',
            function()
                require('oil').open(nil, {
                    preview = { vertical = true },
                })
            end,
            desc = 'Oil: Open file explorer',
            silent = true,
        },
    },
    opts = {
        default_file_explorer = true,
        constrain_cursor = 'editable',
        columns = { 'icon' },
        delete_to_trash = false,
        prompt_save_on_select_new_entry = true,
        cleanup_delay_ms = 2000,
        watch_for_changes = true,
        lsp_file_methods = {
            enabled = true,
            timeout_ms = 1000,
            autosave_changes = false,
        },
        view_options = {
            show_hidden = true,
            is_hidden_file = function(name)
                return name:sub(1, 1) == '.'
            end,
            is_always_hidden = function()
                return false
            end,
            natural_order = 'fast',
            sort = {
                { 'type', 'asc' },
                { 'name', 'asc' },
            },
        },
    },
    init = function()
        vim.cmd 'cd ~'
    end,
}
