local M = {
    'stevearc/oil.nvim',
    event = 'VimEnter',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}

M.config = function()
    vim.keymap.set("n", "<leader>bb", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })   
    require('oil').setup({
            default_file_explorer = true
    })
end

return M
