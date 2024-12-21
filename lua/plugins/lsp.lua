-- these lsp need to be installed always
local ensure_installed_lsps = {
    'lua_ls',
    'clangd'
}

return {
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        config = function()
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
                callback = function(event)
                    -- for LSP related items. It sets the mode, buffer and description for us each time.
                    local map = function(keys, func, desc, mode)
                        mode = mode or 'n'
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                    end

                    -- TODO: move this into a better place so that it is obvious
                    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
                    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                    map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
                    map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
                    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
                    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
                    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
                    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                        map('<leader>th', function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
                        end, '[T]oggle Inlay [H]ints')
                    end
                end,
            })

            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({})
            lspconfig.clangd.setup({})

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force',
                vim.lsp.protocol.make_client_capabilities(),
                require('cmp_nvim_lsp').default_capabilities()
            )
            -- Performance fix for slow lsp as per https://www.reddit.com/r/neovim/comments/161tv8l/comment/jzfen6b
            capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false
        end,
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'saghen/blink.cmp',
            'Bilal2453/luvit-meta'
        }
    },

    {
        'williamboman/mason.nvim',
        lazy = false,
        config = function()
            require('mason').setup()
        end
    },

    {
        'williamboman/mason-lspconfig.nvim',
        lazy = false,
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = ensure_installed_lsps
            })
        end
    },

    {
        'folke/lazydev.nvim',
        ft = 'lua', -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = 'luvit-meta/library', words = { 'vim%.uv' } },
            },
        },
    },

    { 'Bilal2453/luvit-meta', lazy = true }, -- optional `vim.uv` typings

    {
        -- optional cmp completion source for require statements and module annotations
        'hrsh7th/nvim-cmp',
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = 'lazydev',
                group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            })
        end,
    },


    {
        'saghen/blink.cmp',
        version = 'v0.*',
        opts = {
            sources = {
                -- add lazydev to your completion providers
                default = {
                    'lsp', 'path', 'snippets', 'buffer', 'lazydev'
                },
                providers = {
                    -- adjust fallback configuration
                    lsp = {
                        fallbacks = { 'lazydev' }
                    },
                    lazydev = {
                        name = 'LazyDev',
                        module = 'lazydev.integrations.blink'
                    },
                },
            },
        },
    }

}
