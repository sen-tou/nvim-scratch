return {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require('github-theme').setup({})

        vim.cmd('colorscheme github_dark_default')

        -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
        -- vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
        -- vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
        -- vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.foreground })
        -- vim.api.nvim_set_hl(0, 'Visual', { bg = colors.selection_bg })
    end
}
