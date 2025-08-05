local M = {}

table.insert(M, {
    'mason-org/mason.nvim',
})

table.insert(M, {
    'mason-org/mason-lspconfig.nvim',
})

table.insert(M, {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
        require('mason').setup()
        require('mason-lspconfig').setup()
        require('mason-tool-installer').setup {
            ensure_installed = {
                'lua_ls',
            },
        }
    end,
})

return M
