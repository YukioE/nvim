local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- centering
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')
map('n', '}', '}zz')
map('n', '{', '{zz')
map('n', ']m', ']mzz')
map('n', '[m', '[mzz')
map('n', ']M', ']Mzz')
map('n', '[M', '[Mzz')
map('n', 'j', 'jzz')
map('n', 'k', 'kzz')
map('n', 'G', 'Gzz')
map('n', 'gg', 'ggzz')
map('n', '<C-T>', '<C-T>zz')
map('n', '<C-D>', '<C-D>zz')
map('n', '<C-U>', '<C-U>zz')
map('n', ']d', ':lua vim.diagnostic.goto_next({ float = false })<CR>zz', { desc = 'goto next [D]iagnostic' })
map('n', '[d', ':lua vim.diagnostic.goto_prev({ float = false })<CR>zz', { desc = 'goto previous [D]iagnostic' })

map('n', '<leader>lq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
map('n', '<leader>,', '<cmd>cp<CR>', { desc = 'goto previous Quickfix entry' })
map('n', '<leader>.', '<cmd>cn<CR>', { desc = 'goto next Quickfix entry' })

map('n', '<leader>tr', function()
    vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = 'toggle [R]elative line numbers' })

map('n', '<C-S-a>', function()
    vim.cmd '%y+'
end, { desc = 'yank whole Buffer to system clipboard' })
vim.keymap.set('n', '<Leader>bc', '<cmd>CopyFullPath<CR>', { desc = 'Copy file path to clipboard', silent = true })

-- moving focus between windows
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('t', '<C-h>', '<cmd>wincmd h<CR>')
map('t', '<C-j>', '<cmd>wincmd j<CR>')
map('t', '<C-k>', '<cmd>wincmd k<CR>')
map('t', '<C-l>', '<cmd>wincmd l<CR>')

-- resizing windows
map('n', '<C-Up>', ':resize -2<CR>')
map('n', '<C-Down>', ':resize +2<CR>')
map('n', '<C-Left>', ':vertical resize -2<CR>')
map('n', '<C-Right>', ':vertical resize +2<CR>')

map('t', '<C-Up>', '<cmd>resize -2<CR>')
map('t', '<C-Down>', '<cmd>resize +2<CR>')
map('t', '<C-Left>', '<cmd>vertical resize -2<CR>')
map('t', '<C-Right>', '<cmd>vertical resize +2<CR>')

-- window management
-- use native commands (CTRL w + s, v, q) for splitting / deleting windows
map('n', '<leader>bM', '<C-W>|<C-W>_', { desc = 'maximize Window' })
map('n', '<leader>bm', '<C-W>=', { desc = 'size Windows equally' })

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

map('n', '<S-h>', '<cmd>bprevious<cr>zz', { desc = 'prev Buffer' })
map('n', '<S-l>', '<cmd>bnext<cr>zz', { desc = 'next Buffer' })
map('n', '<leader>f', delete_buffer, { desc = 'close [B]uffer' })
map('n', '<C-s>', ':w!<CR>', { desc = 'write Buffer' })

-- moving lines up/down/left/right in visual mode
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Terminal
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
map('n', '<leader>tt', '<cmd>ter<CR>', { desc = 'open [T]erminal' })
map('n', '<leader>tl', '<cmd>ter lazygit<CR>an<CR>', { desc = 'open lazygit in terminal' })

-- git mergetool
map('n', '<leader>mh', '<cmd>diffget //2<CR>', { desc = 'accept LOCAL change (LEFT)' })
map('n', '<leader>ml', '<cmd>diffget //3<CR>', { desc = 'accept REMOTE change (RIGHT)' })
map('n', '<leader>mw', '<cmd>Gwrite<CR>', { desc = 'write and stage file' })
map('n', '<leader>md', function()
    vim.cmd 'Ghdiffsplit :2|Gvdiffsplit :3'
    vim.cmd 'wincmd k'
    vim.api.nvim_feedkeys(']c', 'n', true)
end, { desc = 'Open 3-way merge tool' })

-- Markdown
map('n', '<leader>tm', ':MarkdownPreviewToggle<CR>', { desc = 'start Markdown preview' })
map('n', '<leader>so', ':ObsidianQuickSwitch<CR>', { desc = 'open Quick switcher' })
