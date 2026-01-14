return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            c = { 'clang-format' }
        },
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_format = 'fallback',
        },
    },
    keys = {
        {
            '<leader>cf',
            function()
                require('conform').format({ async = true, lsp_format = 'fallback' })
            end,
            desc = 'Conform: Format'
        },
    },
    lazy = false,
}
