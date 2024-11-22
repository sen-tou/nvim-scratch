local util = require 'core/utils'
local opts = { noremap = true, silent = true }

-- Make window navigation easier
vim.keymap.set('n', '<C-k>', '<C-w>k', util.tableMerge(opts, { desc = 'Move window up' }))
vim.keymap.set('n', '<C-j>', '<C-w>j', util.tableMerge(opts, { desc = 'Move window down' }))
vim.keymap.set('n', '<C-h>', '<C-w>h', util.tableMerge(opts, { desc = 'Move window left' }))
vim.keymap.set('n', '<C-l>', '<C-w>l', util.tableMerge(opts, { desc = 'Move window right' }))

-- better terminal commands
-- |NOTE| this does not work in WSL2 and it seems not to be fixed by microsoft at this point
vim.keymap.set('t', '<C-\\><C-n>', '<Leader><ESC>', util.tableMerge(opts, { desc = 'Exit terminal mode with ESC' }))

vim.keymap.set('n', '<Up>', ':<Up>', util.tableMerge(opts, { desc = 'Switch through last command without typing' }))

vim.keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>', util.tableMerge(opts, { desc = 'Remove search highlight' }))

-- stay in visual mode after indenting
vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set('v', '<', '<gv', opts)

-- move higligthed lines up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)

vim.keymap.set({ 'n', 'v' }, '<leader>p', '"_p', util.tableMerge(opts, { desc = 'Paste without affecting the current register' }))
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', util.tableMerge(opts, { desc = 'Delete without affecting the current register' }))

vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

return {}
