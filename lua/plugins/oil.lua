return {
    'stevearc/oil.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
        require('oil').setup({
            default_file_explorer = true, -- diable netrw, use oil instead
            columns = {},
            keymaps = {
                ['<C-h>'] = false,
                ['<C-c>'] = false,
                ['q'] = 'actions.close',
                ['<M-h>'] = 'actions.select_split'
            },
            delete_on_trash = true,
            view_options = {
                show_hidden = true,
            },
            skip_confirm_for_simple_edits = true,
        })

        vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Go to parent dir' })
        vim.keymap.set('n', '<leader>-', require('oil').toggle_float, { desc = 'toggle floating window' })
    end
}
