return {
    'ahmedkhalf/project.nvim',
    lazy = false,
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
        require('project_nvim').setup {
            detection_methods = { 'pattern', 'lsp' },
            patterns = { '.git', '.gitconfig', 'config.json', 'Makefile', 'package.json', 'composer.json' },
            show_hidden = true,
        }

        require('telescope').load_extension 'projects'
    end,
    keys = {
        { '<leader>sp', '<cmd>Telescope projects<CR>', desc = 'Find Projects' },
    },
}
