local g = vim.g
local opt = vim.opt

g.netrw_banner = 0

-- map leader key
vim.keymap.set('', '<Space>', '<Nop>')
g.mapleader = ' '
g.maplocalleader = ' '

g.editorconfig = true

-- some options
opt.number = true
opt.relativenumber = true

-- scrolloff to the top and bottom of the buffer
opt.scrolloff = 20

-- default tabs/spaces config (will be overriden by detection plugin as needed)
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = false

-- search and replace
opt.smartcase = true
opt.ignorecase = true
opt.inccommand = 'split'

-- status line settings
opt.laststatus = 3
-- o.cmdheight = 0

opt.swapfile = false
opt.backup = false
opt.undofile = true

opt.termguicolors = true
opt.background = 'dark'
opt.signcolumn = 'yes'

opt.backspace = { 'start', 'eol', 'indent' }

opt.splitbelow = true
opt.splitright = true

return {}
