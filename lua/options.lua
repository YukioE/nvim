vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '│ ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.conceallevel = 0
vim.opt.shada = [['100,<50,s10,h]]
vim.o.foldmethod = 'indent'
vim.o.foldlevelstart = 99
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

-- Neovide
if vim.g.neovide then
    vim.o.guifont = 'JetBrainsMono Nerd Font:h14'
    vim.g.neovide_scale_factor = 0.8
    vim.g.neovide_hide_mouse_when_typing = true
end

vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

-- virtual lines for diagnostics
vim.diagnostic.config {
    virtual_lines = { current_line = true },
    severity_sort = true,
}

-- disable terminal linenumbers
vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end,
})

-- highlight yanking
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- create custom command to copy full path
vim.api.nvim_create_user_command('CopyFullPath', function()
    local full_path = vim.fn.expand '%:p'
    vim.fn.setreg('+', full_path)
    print('Copied to clipboard: ' .. full_path)
end, {})
