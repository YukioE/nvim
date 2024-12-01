function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

Map('n', '<Esc>', '<cmd>nohlsearch<CR>')

Map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

Map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- moving focus to buffers & terminal
Map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
Map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
Map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
Map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

Map('t', '<C-h>', '<cmd>wincmd h<CR>')
Map('t', '<C-j>', '<cmd>wincmd j<CR>')
Map('t', '<C-k>', '<cmd>wincmd k<CR>')
Map('t', '<C-l>', '<cmd>wincmd l<CR>')

-- resizing buffers & terminal
Map('n', '<C-Up>', ':resize -2<CR>')
Map('n', '<C-Down>', ':resize +2<CR>')
Map('n', '<C-Left>', ':vertical resize -2<CR>')
Map('n', '<C-Right>', ':vertical resize +2<CR>')

-- terminal
Map('t', '<C-Up>', '<cmd>resize -2<CR>')
Map('t', '<C-Down>', '<cmd>resize +2<CR>')
Map('t', '<C-Left>', '<cmd>vertical resize -2<CR>')
Map('t', '<C-Right>', '<cmd>vertical resize +2<CR>')

-- moving lines up/down/left/right in visual mode
Map('v', 'J', ":m '>+1<CR>gv=gv")
Map('v', 'K', ":m '<-2<CR>gv=gv")
Map('v', '<', '<gv')
Map('v', '>', '>gv')

-- TODO fix/refactor buffer keymaps
Map('n', '<leader>bd', ':bd<CR>')

-- highlight yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
