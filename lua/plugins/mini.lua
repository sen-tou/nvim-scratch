-- some misc plugins that do one or two things
return {
    {
        'echasnovski/mini.nvim',
        version = '*',
        config = function()
            require('mini.move').setup()
        end,
    },
}
