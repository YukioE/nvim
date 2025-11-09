return {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && npm install',
    -- cd to 'nvim-data/lazy/markdown-preview.nvim' and run npm install
    init = function()
        vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
}
