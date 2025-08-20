local M = {}

table.insert(M, {
    'mason-org/mason.nvim',
    opts = {},
})

table.insert(M, {
    'mason-org/mason-lspconfig.nvim',
    opts = {},
})

table.insert(M, {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
        require('mason').setup()
        require('mason-lspconfig').setup()
        require('mason-tool-installer').setup {
            ensure_installed = {
                'lua_ls', 'cmake', 'jsonls', 'clangd'
            },
        }
    end,
})

return M
