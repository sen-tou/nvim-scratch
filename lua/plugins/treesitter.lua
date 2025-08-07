return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    lazy = false,
    build = ':TSUpdate',
    ensure_installed = {
        'c',
        'cpp',
        'cmake',
        'lua',
        'vim',
        'vimdoc',
        'markdown',
        'markdown_inline',
    },
    opts = {},
}
