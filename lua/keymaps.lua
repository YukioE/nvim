function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

Map('n', '<Esc>', '<cmd>nohlsearch<CR>')

Map('n', '<leader>lq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

Map('n', '<C-a>', function()
  vim.cmd '%y+'
end, { desc = 'yank whole Buffer to system clipboard' })

-- moving focus between windows
Map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
Map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
Map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
Map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

Map('t', '<C-h>', '<cmd>wincmd h<CR>')
Map('t', '<C-j>', '<cmd>wincmd j<CR>')
Map('t', '<C-k>', '<cmd>wincmd k<CR>')
Map('t', '<C-l>', '<cmd>wincmd l<CR>')

-- resizing windows
Map('n', '<C-Up>', ':resize -2<CR>')
Map('n', '<C-Down>', ':resize +2<CR>')
Map('n', '<C-Left>', ':vertical resize -2<CR>')
Map('n', '<C-Right>', ':vertical resize +2<CR>')

Map('t', '<C-Up>', '<cmd>resize -2<CR>')
Map('t', '<C-Down>', '<cmd>resize +2<CR>')
Map('t', '<C-Left>', '<cmd>vertical resize -2<CR>')
Map('t', '<C-Right>', '<cmd>vertical resize +2<CR>')

-- window management
-- use native commands (CTRL w + s, v, q) for splitting / deleting windows
Map('n', '<leader>bM', '<C-W>|<C-W>_', { desc = 'maximize Window' })
Map('n', '<leader>bm', '<C-W>=', { desc = 'size Windows equally' })

-- buffer utils
local function delete_buffer()
  local bufnr = vim.api.nvim_get_current_buf()
  local buf_type = vim.bo[bufnr].buftype

  if vim.bo[bufnr].modified then
    local choice = vim.fn.confirm('Buffer has unsaved changes. Save before closing?', '&Yes\n&No\n&Cancel', 1)
    if choice == 1 then
      vim.cmd 'write' -- Save the buffer
    elseif choice == 2 then
      vim.cmd 'bd!' -- Discard changes and force-delete buffer
      return
    elseif choice == 3 then
      return -- Cancel
    end
  end

  if buf_type == 'terminal' then
    vim.cmd 'bd!'
  else
    vim.cmd 'bd'
  end
end

Map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'prev Buffer' })
Map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'next Buffer' })
Map('n', '<leader>bd', delete_buffer, { desc = 'close [B]uffer' })

-- saving & quitting
Map('n', '<C-s>', ':w<CR>', { desc = 'write Buffer' })
Map('n', '<leader>qq', ':wqa!<CR>', { desc = 'quit all with saving' })
Map('n', '<leader>qQ', ':qa!<CR>', { desc = 'quit all without saving' })

-- moving lines up/down/left/right in visual mode
Map('v', 'J', ":m '>+1<CR>gv=gv")
Map('v', 'K', ":m '<-2<CR>gv=gv")
Map('v', '<', '<gv')
Map('v', '>', '>gv')

-- Terminal
Map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
Map('n', '<leader>tt', ':ter<CR>', { desc = 'open [T]erminal' })

-- git mergetool
Map('n', '<leader>mh', '<cmd>diffget //2<CR>', { desc = 'accept LOCAL change (LEFT)' })
Map('n', '<leader>ml', '<cmd>diffget //3<CR>', { desc = 'accept REMOTE change (RIGHT)' })
Map('n', '<leader>mw', '<cmd>Gwrite<CR>', { desc = 'write and stage file' })
Map('n', '<leader>md', function()
  vim.cmd 'Ghdiffsplit :2|Gvdiffsplit :3'
  vim.cmd 'wincmd k'
  vim.api.nvim_feedkeys(']c', 'n', true)
end, { desc = 'Open 3-way merge tool' })

-- Markdown
Map('n', '<leader>tm', ':MarkdownPreviewToggle<CR>', { desc = 'start Markdown preview' })
Map('n', '<leader>so', ':ObsidianQuickSwitch<CR>', { desc = 'open Quick switcher' })

-- highlight yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
