return {
    { 'nmac427/guess-indent.nvim',
    opts = {
        -- respect indetation even if there is a .editorconfig
        -- good for external code that shouldn't be reindented
        override_editorconfig = true
    } , event = 'BufEnter'}
}

