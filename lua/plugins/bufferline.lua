return {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- For icons support
    config = function()
        vim.opt.termguicolors = true -- Enable terminal GUI colors
        require('bufferline').setup {
            options = {
                diagnostics = 'nvim_lsp', -- Enable LSP diagnostics
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    -- Show different icons and counts for each diagnostic type
                    local s = ' '
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or ' ')
                        s = s .. n .. sym
                    end
                    return s
                end,
                offsets = {
                    {
                        filetype = 'neo-tree', -- Add an offset for NvimTree
                        text = 'File Explorer', -- Display name
                        text_align = 'left', -- Align text to the left
                        separator = true, -- Add a separator between the file explorer and buffers
                    },
                },
                show_close_icon = false, -- Hide close icon
                separator_style = 'slant', -- Use a slanted separator style
                always_show_bufferline = true, -- Always show the bufferline
            },
        }
    end,
}
