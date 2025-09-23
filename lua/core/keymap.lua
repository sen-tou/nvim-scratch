local u = require 'core/utils'
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
m = u.tblMerge

-- Make window navigation easier
keymap('n', '<C-k>', '<C-w>k', m(opts, { desc = 'Move window up' }))
keymap('n', '<C-j>', '<C-w>j', m(opts, { desc = 'Move window down' }))
keymap('n', '<C-h>', '<C-w>h', m(opts, { desc = 'Move window left' }))
keymap('n', '<C-l>', '<C-w>l', m(opts, { desc = 'Move window right' }))
keymap('n', '<leader>sv', '<C-w>v', m(opts, { desc = 'Split window vertically' }))
keymap('n', '<leader>sh', '<C-w>s', m(opts, { desc = 'Split window horizontally' }))
keymap('n', '<leader>se', '<C-w>=', m(opts, { desc = 'Make splits equal size' })) -- make split windows equal width & height
keymap('n', '<leader>sx', '<cmd>close<CR>', m(opts, { desc = 'Close current split' }))
keymap('n', '<DOWN>', ':resize +2<CR>', m(opts, { desc = 'Resize horizontally-' }))
keymap('n', '<UP>', ':resize -2<CR>', m(opts, { desc = 'Resize horizontally+' }))
keymap('n', '<RIGHT>', ':vertical resize +2<CR>', m(opts, { desc = 'Resize vertically-' }))
keymap('n', '<LEFT>', ':vertical resize -2<CR>', m(opts, { desc = 'Resize vertically+' }))
keymap('n', 'j', "(v:count ? 'j' : 'gj')", { expr = true })
keymap('n', 'k', "(v:count ? 'k' : 'gk')", { expr = true })

keymap('n', '<C-n>', ':cnext<CR>', m(opts, { desc = 'Next Quickfix' }))
keymap('n', '<C-p>', ':cprevious<CR>', m(opts, { desc = 'Prev Quickfix' }))

-- better terminal commands
-- |NOTE| this does not work in WSL2 and it seems not to be fixed by microsoft at this point
keymap('t', '<C-\\><C-n>', '<Leader><ESC>', m(opts, { desc = 'Exit terminal mode with ESC' }))
-- keymap('n', '<Up>', ':<Up>', m(opts, { desc = 'Switch through last command without typing' }))

keymap('n', '<ESC>', '<cmd>nohlsearch<CR>', m(opts, { desc = 'Remove search highlight' }))
keymap('n', '<C-c>', '<cmd>nohlsearch<CR>', m(opts, { desc = 'Remove search highlight' }))

-- stay in visual mode after indenting
keymap('v', '>', '>gv', m(opts, { desc = 'stay in visual mode after indenting right' }))
keymap('v', '<', '<gv', m(opts, { desc = 'stay in visual mode after indenting left' }))

keymap({ 'n', 'v' }, '<leader>p', '"_p', m(opts, { desc = 'Paste without affecting the current register' }))
keymap({ 'n', 'v' }, 'P', '"+p', m(opts, { desc = 'Paste from clipboard' }))
keymap({ 'n', 'v' }, 'Y', '"+y', m(opts, { desc = 'Copy from clipboard' }))
keymap({ 'n', 'v' }, '<leader>d', '"_d', m(opts, { desc = 'Delete without affecting the current register' }))
keymap('n', 'x', '"_x', m(opts, { desc = 'Delete char without copy to clipboard' }))

keymap('n', 'n', 'nzzzv', m(opts, { desc = 'center next occurance' }))
keymap('n', 'N', 'Nzzzv', m(opts, { desc = '' }))
keymap('n', '<C-d>', '<C-d>zz', m(opts, { desc = 'Move half page down and center vertically' }))
keymap('n', '<C-u>', '<C-u>zz', m(opts, { desc = 'Move half page up and center vertically' }))

keymap('n', 'Q', '<nop>', m(opts, { desc = 'disable Q' }))

-- Replace the word cursor is on globally
keymap(
    'n',
    '<leader>rg',
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    m(opts, { desc = 'Replace word cursor is on globally' })
)

-- Executes shell command from in here making file executable
keymap('n', '<leader>x', '<cmd>!chmod +x %<CR>', m(opts, { desc = 'makes file executable' }))

-- Hightlight yanking
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- compile a cmake project
keymap('n', '<leader>cc', function()
    vim.cmd '!./build.sh'
end, { desc = 'Build CMake Project in the current dir' })

-- more lsp stuff
keymap('n', 'grD', vim.lsp.buf.declaration, { desc = 'Jump to declaration' })
keymap('n', 'grd', vim.lsp.buf.definition, { desc = 'Jump to definition' })

return {}
