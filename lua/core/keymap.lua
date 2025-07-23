local u = require 'core/utils'
local opts = { noremap = true, silent = true }
m = u.tblMerge

-- Make window navigation easier
vim.keymap.set('n', '<C-k>', '<C-w>k', m(opts, { desc = 'Move window up' }))
vim.keymap.set('n', '<C-j>', '<C-w>j', m(opts, { desc = 'Move window down' }))
vim.keymap.set('n', '<C-h>', '<C-w>h', m(opts, { desc = 'Move window left' }))
vim.keymap.set('n', '<C-l>', '<C-w>l', m(opts, { desc = 'Move window right' }))

-- Quickfix navigation
vim.keymap.set('n', '<C-n>', ':cnext<CR>', m(opts, { desc = 'Next Quickfix' }))
vim.keymap.set('n', '<C-p>', ':cprevious<CR>', m(opts, { desc = 'Prev Quickfix' }))

-- better terminal commands
-- |NOTE| this does not work in WSL2 and it seems not to be fixed by microsoft at this point
vim.keymap.set('t', '<C-\\><C-n>', '<Leader><ESC>', m(opts, { desc = 'Exit terminal mode with ESC' }))
vim.keymap.set('n', '<Up>', ':<Up>', m(opts, { desc = 'Switch through last command without typing' }))

vim.keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>', m(opts, { desc = 'Remove search highlight' }))
vim.keymap.set('n', '<C-c>', '<cmd>nohlsearch<CR>', m(opts, { desc = 'Remove search highlight' }))


-- stay in visual mode after indenting
vim.keymap.set('v', '>', '>gv', opts) vim.keymap.set('v', '<', '<gv', opts)

-- move higligthed lines up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)

vim.keymap.set({ 'n', 'v' }, '<leader>p', '"_p',
    m(opts, { desc = 'Paste without affecting the current register' }))
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d',
    m(opts, { desc = 'Delete without affecting the current register' }))
vim.keymap.set('n', 'x', '"_x', m(opts, { desc = 'Delete char without copy to clipboard' }))

vim.keymap.set('n', 'n', 'nzzzv', m(opts, { desc = 'center next occurance' }))
vim.keymap.set('n', 'N', 'Nzzzv', opts)
vim.keymap.set('n', '<C-d>', '<C-d>zz', m(opts, { desc = 'Move half page down and center vertically' }))
vim.keymap.set('n', '<C-u>', '<C-u>zz', m(opts, { desc = 'Move half page up and center vertically' }))

vim.keymap.set('n', 'Q', '<nop>', m(opts, { desc = 'disable Q' }))

-- Replace the word cursor is on globally
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word cursor is on globally" })

return {}
