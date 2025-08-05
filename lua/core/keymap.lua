local u = require 'core/utils'
local opts = { noremap = true, silent = true }
m = u.tblMerge

-- Make window navigation easier
vim.keymap.set('n', '<C-k>', '<C-w>k', m(opts, { desc = 'Move window up' }))
vim.keymap.set('n', '<C-j>', '<C-w>j', m(opts, { desc = 'Move window down' }))
vim.keymap.set('n', '<C-h>', '<C-w>h', m(opts, { desc = 'Move window left' }))
vim.keymap.set('n', '<C-l>', '<C-w>l', m(opts, { desc = 'Move window right' }))
vim.keymap.set('n', '<leader>sv', '<C-w>v', m(opts, { desc = 'Split window vertically' }))
vim.keymap.set('n', '<leader>sh', '<C-w>s', m(opts, { desc = 'Split window horizontally' }))
vim.keymap.set('n', '<leader>se', '<C-w>=', m(opts, { desc = 'Make splits equal size' })) -- make split windows equal width & height
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', m(opts, { desc = 'Close current split' }))
vim.keymap.set('n', '<C-n>', ':cnext<CR>', m(opts, { desc = 'Next Quickfix' }))

vim.keymap.set('n', '<C-p>', ':cprevious<CR>', m(opts, { desc = 'Prev Quickfix' }))

-- better terminal commands
-- |NOTE| this does not work in WSL2 and it seems not to be fixed by microsoft at this point
vim.keymap.set('t', '<C-\\><C-n>', '<Leader><ESC>', m(opts, { desc = 'Exit terminal mode with ESC' }))
vim.keymap.set('n', '<Up>', ':<Up>', m(opts, { desc = 'Switch through last command without typing' }))

vim.keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>', m(opts, { desc = 'Remove search highlight' }))
vim.keymap.set('n', '<C-c>', '<cmd>nohlsearch<CR>', m(opts, { desc = 'Remove search highlight' }))

-- stay in visual mode after indenting
vim.keymap.set('v', '>', '>gv', m(opts, { desc = 'stay in visual mode after indenting right' }))
vim.keymap.set('v', '<', '<gv', m(opts, { desc = 'stay in visual mode after indenting left' }))

vim.keymap.set({ 'n', 'v' }, '<leader>p', '"_p', m(opts, { desc = 'Paste without affecting the current register' }))
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', m(opts, { desc = 'Delete without affecting the current register' }))
vim.keymap.set('n', 'x', '"_x', m(opts, { desc = 'Delete char without copy to clipboard' }))

vim.keymap.set('n', 'n', 'nzzzv', m(opts, { desc = 'center next occurance' }))
vim.keymap.set('n', 'N', 'Nzzzv', m(opts, { desc = '' }))
vim.keymap.set('n', '<C-d>', '<C-d>zz', m(opts, { desc = 'Move half page down and center vertically' }))
vim.keymap.set('n', '<C-u>', '<C-u>zz', m(opts, { desc = 'Move half page up and center vertically' }))

vim.keymap.set('n', 'Q', '<nop>', m(opts, { desc = 'disable Q' }))

-- Replace the word cursor is on globally
vim.keymap.set(
    'n',
    '<leader>rg',
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    m(opts, { desc = 'Replace word cursor is on globally' })
)

-- Executes shell command from in here making file executable
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', m(opts, { desc = 'makes file executable' }))

-- Hightlight yanking
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

return {}
