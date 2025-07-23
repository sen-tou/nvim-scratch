vim.g.netrw_banner = 0

-- map leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.editorconfig = true

-- some options
vim.opt.number = true
vim.opt.relativenumber = true

-- make clipboard sync with os clipboard
vim.opt.clipboard = 'unnamedplus'

-- scrolloff to the top and bottom of the buffer
vim.opt.scrolloff = 20

-- default tabs/spaces config (will be overriden by detection plugin as needed)
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false 

-- status line settings
vim.opt.laststatus = 3
-- vim.opt.cmdheight = 0

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.signcolumn = 'yes'

vim.opt.backspace = {'start', 'eol', 'indent'}

return {}
