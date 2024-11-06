-- Make window navigation easier
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move window up' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move window down' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move window left' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move window right' })

-- better terminal commands
-- |NOTE| this does not work in WSL2 and it seems not to be fixed by microsoft at this point
vim.keymap.set('t', '<C-\\><C-n>', '<Leader><ESC>', { noremap = true, silent = true, desc = 'Exit terminal mode with ESC' })

vim.keymap.set('n', '<Up>', ':<Up>', { desc = 'Switch through last command without typing' })

vim.keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>', { desc = 'Remove search highlight' })

-- stay in visual mode after indenting
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })

vim.keymap.set({'n', 'v'}, '<leader>p', '"_p', { noremap = true, silent = true, desc = 'Paste without affecting the current register' })
vim.keymap.set({'n', 'v'}, '<leader>d', '"_d', { noremap = true, silent = true, desc = 'Delete without affecting the current register' })

return {}
