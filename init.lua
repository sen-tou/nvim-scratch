-- mind the order of these imports especially when dealing with keymaps
require 'core.utils'
require 'core.opts'
require 'core.keymap'
require 'core.cmd'

-- custom theme setup
local blueberry = require 'blueberry'
blueberry.colorscheme()

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup { {
    import = 'plugins',
} }

-- custom filetypes
vim.filetype.add {
    pattern = { ['.froog_config'] = 'toml' },
}

-- setup lsp neovim 0.11
vim.lsp.enable { 'clangd', 'lua_ls', 'cmake', 'json-lsp', 'taplo', 'basedpyright' }
vim.diagnostic.config {
    virtual_text = { current_line = true },
}
