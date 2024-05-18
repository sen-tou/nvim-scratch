-- map leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.editorconfig = true

-- some options
vim.opt.number = true
vim.opt.relativenumber = true

-- make clipboard sync with os clipboard
vim.opt.clipboard = 'unnamedplus'

-- scrolloff to the top and bottom of the buffer
vim.opt.scrolloff = 10

-- default tabs/spaces config (will be overriden by detection plugin as needed)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

return {}
