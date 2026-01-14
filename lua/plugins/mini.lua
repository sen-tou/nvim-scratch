-- some misc plugins that do one or two things
return {
    {
        'nvim-mini/mini.nvim',
        version = '*',
        config = function()
            require('mini.move').setup()
            require('mini.surround').setup()
        end,
    },
}
