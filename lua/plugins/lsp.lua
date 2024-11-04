return {
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
                ensure_installed = {
                    'lua_ls',
                    'clangd'
                }
            })
        end
    },
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

                    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

                    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

                    map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

                    map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

                    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

                    -- Fuzzy find all the symbols in your current workspace.
                    --  Similar to document symbols, except searches over your entire project.
                    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

                    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

                    -- Execute a code action, usually your cursor needs to be on top of an error
                    -- or a suggestion from your LSP for this to activate.
                    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

                    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                    -- The following two autocommands are used to highlight references of the
                    -- word under your cursor when your cursor rests there for a little while.
                    --    See `:help CursorHold` for information about when this is executed
                    --
                    -- When you move your cursor, the highlights will be cleared (the second autocommand).
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                        local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
                        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })

                        vim.api.nvim_create_autocmd('LspDetach', {
                            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                            end,
                        })
                    end

                    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                        map('<leader>th', function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
                        end, '[T]oggle Inlay [H]ints')
                    end
                end,
            })

            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({})

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
    { -- optional cmp completion source for require statements and module annotations
        'hrsh7th/nvim-cmp',
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = 'lazydev',
                group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            })
        end,
    },
    { -- optional blink completion source for require statements and module annotations
        'saghen/blink.cmp',
        version = 'v0.*',
        opts = {
            sources = {
                -- add lazydev to your completion providers
                completion = {
                    enabled_providers = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
                },
                providers = {
                    -- dont show LuaLS require statements when lazydev has items
                    lsp = { fallback_for = { 'lazydev' } },
                    lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink' },
                },
            },
        },
    }
}
