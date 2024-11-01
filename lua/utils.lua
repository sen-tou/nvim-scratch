local M = {}

M.o = function(option, value)
    vim.opt[option] = value
end
M.g = function(option, value)
    vim.g[option] = value
end

return M
