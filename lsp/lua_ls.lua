vim.lsp.config.lua_ls = {
    cmd = { 'lua-language-server' },
    root_markers = { '.luarc.json', '.git' },
    filetypes = { 'lua' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT'
            },
			diagnostics = {
				globals = {
					'vim',
					'require'
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
        }
    }
}

