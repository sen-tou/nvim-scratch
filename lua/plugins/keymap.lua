-- Make window navigation easier
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move window up' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move window down' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move window left' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move window right' })

-- better terminal commands
-- |NOTE| this does not work in WSL2 and it seems not to be fixed by microsoft at this point
vim.keymap.set('t', "<C-\\><C-n>", '<Leader><ESC>', { noremap = true, silent = true, desc = 'Exit terminal mode with ESC' })

vim.keymap.set('n', '<Up>', ':<Up>', { desc = 'Switch through last command without typing' })

return {}
