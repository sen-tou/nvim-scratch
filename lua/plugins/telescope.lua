return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    event = 'VimEnter',

    dependencies = {
        'nvim-lua/plenary.nvim',
        { -- Telescope FZF Native for faster sorting
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable('make') == 1
            end,
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        { 
            'nvim-tree/nvim-web-devicons', 
            enabled = vim.g.have_nerd_font  -- Requires a Nerd Font for pretty icons 
        },
    },

    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')

        telescope.setup {
            defaults = {
                file_ignore_patterns = {'node_modules', '.git', 'vendor', '.ssh'}
            },
            pickers = {
                find_files = {
                    hidden = true
                }
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown({})
                }
            }
        }

        -- Load extensions
        pcall(telescope.load_extension, 'fzf')
        pcall(telescope.load_extension, 'ui-select')

        -- Keybindings
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader> ', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end,
}
