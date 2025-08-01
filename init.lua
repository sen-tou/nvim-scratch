require "core.utils"
require "core.keymap"
require "core.opts"

local blueberry = require "blueberry"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ {
    import = "plugins",
} }, {
    defaults = {
    },
})

-- custom theme setup
blueberry.colorscheme()
