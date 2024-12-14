vim.opt.number = true
vim.opt.relativenumber = true
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
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
-- vim.opt.shell = 'wt.exe'

-- Neovide
if vim.g.neovide then
  vim.o.guifont = 'JetBrainsMono Nerd Font:h14'
  vim.g.neovide_scale_factor = 0.8
end

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- vim: ts=2 sts=2 sw=2 et
