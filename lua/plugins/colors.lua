return {
    'Shatur/neovim-ayu',
    lazy = false,
    config = function()
        vim.cmd.colorscheme 'ayu-dark'

        local colors = require('ayu.colors')
        colors.generate(true)

        vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.foreground })
        vim.api.nvim_set_hl(0, 'Visual', { bg = colors.selection_bg })
    end
}
