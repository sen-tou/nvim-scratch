local M = {}

-- ghostty.nvim theme inspired by banana blueberry
colors = {
    -- Default background and foreground
    Normal = { bg = '#191323', fg = '#cccccc' },
    NormalNc = { bg = '#17141f', fg = '#cccccc' }, -- Inactive background

    -- Cursor and text
    Cursor = { fg = '#e07d13', bg = '#191323' },
    CursorText = { fg = '#ffffff', bg = '#e07d13' },

    -- Selection
    Selection = { bg = '#220525', fg = '#f4f4f4' },

    -- Line numbers
    LineNumber = { fg = '#f1f1f1', bg = '#191323' },
    LineNumberInactive = { fg = '#888888', bg = '#17141f' },

    -- Highlight groups
    -- Error/warning/info
    Error = { fg = '#dc396a', bg = '#191323' },
    Warning = { fg = '#dc396a', bg = '#191323' },
    Info = { fg = '#00bd9c', bg = '#191323' },
    Hint = { fg = '#00bd9c', bg = '#191323' },
    Question = { fg = '#00bd9c', bg = '#191323' },

    -- Search and match
    Search = { fg = '#e6c62f', bg = '#191323' },
    MatchParen = { fg = '#ff6b7f', bg = '#191323' },

    -- Highlight and special
    Highlight = { fg = '#e6c62f', bg = '#191323' },
    Special = { fg = '#da70d6', bg = '#191323' },
    SpecialChar = { fg = '#f9e46b', bg = '#191323' },
    SpecialKey = { fg = '#f9e46b', bg = '#191323' },
    SpecialMark = { fg = '#f9e46b', bg = '#191323' },
    SpecialWhitespace = { fg = '#f9e46b', bg = '#191323' },

    -- Syntax groups
    Comment = { fg = '#495162', bg = '#191323' },
    Constant = { fg = '#98c379', bg = '#191323' },
    String = { fg = '#f9e46b', bg = '#191323' },
    Number = { fg = '#bcf3ff', bg = '#191323' },
    Boolean = { fg = '#f9e46b', bg = '#191323' },
    Function = { fg = '#91fff4', bg = '#191323' },
    Identifier = { fg = '#f1f1f1', bg = '#191323' },
    Keyword = { fg = '#ff6b7f', bg = '#191323' },
    Operator = { fg = '#dc396a', bg = '#191323' },
    Type = { fg = '#98c379', bg = '#191323' },
    Variable = { fg = '#f1f1f1', bg = '#191323' },

    -- UI elements
    Winbar = { bg = '#17141f', fg = '#f1f1f1' },
    WinbarInactive = { bg = '#17141f', fg = '#888888' },

    -- Status line
    Statusline = { bg = '#17141f', fg = '#f1f1f1' },
    StatuslineInactive = { bg = '#17141f', fg = '#888888' },
}

function M.colorscheme()
    vim.cmd 'highlight clear'
    vim.cmd 'syntax reset'

    vim.o.background = 'dark'
    vim.g.colors_name = 'blueberry'

    local set = vim.api.nvim_set_hl

    for k, v in pairs(colors) do
        set(0, k, v)
    end
end
return M
