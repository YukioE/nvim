return {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = {
        { 'echasnovski/mini.icons', opts = {} },
    },
    keys = {
        { '\\', '<CMD>Oil<CR>', desc = 'Oil: Open file explorer', silent = true },
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
            show_hidden = false,
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
        keymaps = {
            ['-'] = { 'actions.parent', mode = 'n' },
            ['<CR>'] = 'actions.select',
            ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
            ['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
            ['<C-t>'] = { 'actions.select', opts = { tab = true } },
            ['<C-c>'] = { 'actions.close', mode = 'n' },
            ['<C-l>'] = 'actions.refresh',
            ['g?'] = { 'actions.show_help', mode = 'n' },
            ['gx'] = 'actions.open_external',
            ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
            ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
        },
    },
    init = function()
        vim.cmd 'cd ~'
    end,
}
