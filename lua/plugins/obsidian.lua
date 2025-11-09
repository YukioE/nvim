return {
    'epwalsh/obsidian.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    opts = {
        disable_frontmatter = true,
        workspaces = {
            {
                name = '1',
                path = '~/basereality22/netsphere/',
            },
        },
    },
}
